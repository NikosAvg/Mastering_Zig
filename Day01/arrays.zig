const std = @import("std");
// Arrays are denoted by [N]T, where N is the number of elements in the array and T is the type of those elements (i.e., the array's child type).
pub fn main() !void {
    const a = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
    const b = [_]u8{ 'w', 'o', 'r', 'l' };
    // To get the size of the array use the .len field
    const length = b.len;
    std.debug.print("Length of B = {}, Length of A = {}!\n", .{ length, a.len });
}
