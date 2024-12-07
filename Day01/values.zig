pub fn main() void {
    // Value assignment in Zig has the following syntax: (const | var) identifier[: type] = value
    // Examples
    const constant: i32 = 5; // signed 32-bit integer
    var variable: u32 = 5000; // unsigned 32-bit integer

    // @as performs an explicit type coercion
    const infered_constant = @as(i32, 5);
    var infered_variable = @as(u32, 5000);

    // Constants and variables must have a value. If no known value can be given, the undefined value,
    // which coerces to any type, may be used as long as a type annotation is provided.
    const a: i32 = undefined;
    var b: u32 = undefined;
}
