const print = @import("std").debug.print;
const time = @import("std").time.timestamp;
const crypto = @import("std").crypto;
const hasher = crypto.pwhash.bcrypt;
const mem = @import("std").mem;
const pwhash = crypto.pwhash;

pub const hash_length: usize = 60;

pub const Params = struct {
    rounds_log: u6,
};

pub const HashOptions = struct {
    allocator: ?mem.Allocator = null,
    params: Params,
    encoding: pwhash.Encoding,
};

pub fn main() void {
    var epochTime: i64 = time();
    print("The time is {d}\n", .{epochTime});
    // pass: []u8 = "hello";
    var buf: [hash_length]u8 = undefined;
    const hash_options = HashOptions{
        .params = .{ .rounds_log = 5 },
        .encoding = .phc,
    };
    var hash = hasher.strHash("hello",hash_options,&buf);
    print("the hash is {s}\n", .{hash});

}
