const expect = @import("std").testing.expect;
// Defer is used to execute a statement while exiting the current block.
test "defer" {
    var x: u16 = 5;
    {
        defer x += 2; // Its excecuted out of this block
        try expect(x == 5); // This passes because x is still 5 in the block
    }
    try expect(x == 7);
}

// If there are multiple defers they are excecuted in reverse order
test "multi defer" {
    var x: f32 = 5;
    {
        defer x += 2;
        defer x /= 2;
    }
    try expect(x == 4.5);
}

// Defer is useful to ensure that resources are cleaned up when they are no longer needed.
// Instead of needing to remember to manually free up the resource, you can add a defer statement right next to the statement that allocates the resource.
