const expect = @import("std").testing.expect;

// Zig's while loops have three parts - a condition, a block and a continue expresion

// No continue expression
test "while" {
    var i: u8 = 2;
    while (i < 100) {
        i *= 2;
    }
    try expect(i == 128);
}

// With continue expression
test "while with continue expression" {
    var sum: u8 = 0;
    var i: u8 = 1;
    while (i <= 10) : (i += 1) {
        sum += i;
    }
    try expect(sum == 55);
}
// While With continue
test "while with continue" {
    var sum: u8 = 0;
    var i: u8 = 0;
    while (i<4) : (i+=1){
        if (i==2) continue;
        sum += i;
    }
    try expect(sum == 4);
}
// While with a break
test "while with break" {
    var sum: u8 = 0;
    var i: u8 = 0;
    while (i <= 3) : (i += 1){
        if(i==2) break;
        sum+=i;
    }
    try expect(sum == 1);
}
