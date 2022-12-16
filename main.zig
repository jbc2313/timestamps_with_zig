const print = @import("std").debug.print;
const time = @import("std").time.timestamp;
pub fn main() void {
    var epochTime: i64 = time();
    print("The time is {d}\n", .{epochTime});

}
