module Lift_tb();

reg clk, reset;
reg [1:0] request;

wire [1:0] current;
wire door, moving_up, moving_down;

Lift dut(
    .clk(clk),
    .reset(reset),
    .moving_up(moving_up),
    .moving_down(moving_down),
    .door(door),
    .current(current),
    .request(request)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;
    request = 0;

    #20 reset = 0;

    #80 request = 2'b11;   // Floor 3
    #80 request = 2'b01;   // Floor 1
    #80 request = 2'b00;   // Floor 0
    #80 request = 2'b10;   // Floor 2
    
    #100 $finish;
    
end

initial begin
    $monitor(
        "Time=%0t Request=%0d Current=%0d Door=%0b Up=%0b Down=%0b",
        $time,
        request,
        current,
        door,
        moving_up,
        moving_down
    );
end

endmodule