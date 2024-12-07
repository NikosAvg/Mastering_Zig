const expect = @import("std").testing.expect;

// An error set is like an enum, where each error in the set is a value.
// There are no exceptions in Zig; errors are values. Let's create an error set.
const FileOpenError = error{
    AccessDenied,
    OutofMemory,
    FileNotFound,
};

const AllocationError = error{OutofMemory};

test "coerce error from a subset to a supercet" {
    const err: FileOpenError = AllocationError.OutofMemory;
    try expect(err == FileOpenError.OutofMemory);
}

// An error set type and another type can be combined with the ! operator to form an error union type.
// Values of these types may be an error value or a value of the other type.
test "error union" {
    const maybe_error: AllocationError!u16 = 10;
    const no_error = maybe_error catch 0; // 0 is a fallback value in case of error

    try expect(@TypeOf(no_error) == u16);
        try expect(no_error == 10);
}

fn failingFunction() error{Oops}!void {
    return error.Oops;
}

test "returning an error" {
    failingFunction() catch |err| {
        try expect(err == error.Oops);
        return;
    };
}

fn failFn() error{Oops}!i32 {
    try failingFunction();
    return 12;
}

test "try" {
    const v = failFn() catch |err| {
        try expect(err == error.Oops);
        return;
    };
    try expect(v == 12);
}

// errdefer works like defer, but only executing when the function is returned from with an error inside of the errdefer's block.
var problems: u32 = 98;

fn failFnCounter() error{Oops}!void {
    errdefer problems += 1;
    try failingFunction();
}

test "errdefer test" {
    failFnCounter() catch |err| {
        try expect(err == error.Oops);
        try expect(problems == 99);
        return;
    };
}
