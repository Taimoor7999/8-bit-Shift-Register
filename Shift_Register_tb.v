module Shift_Register_tb();

parameter N = 8;

reg clk, rst, load, dir, rin;
reg [N-1 : 0] din;
wire [N-1 : 0] q;

Shift_Register #(.N(N)) uut (
    .clk(clk),
    .rst(rst),
    .rin(rin),
    .q(q),
    .load(load),
    .din(din),
    .dir(dir)
);

initial begin
    $dumpfile("8_bit_Shift_Register_Simulation.vcd");
    $dumpvars(0);
end

initial begin

  rst = 1;
  clk = 0;
  rin = 1;
  load = 0;
  dir = 1;
  din = 8'b00000011;

  #30 rst = 0;
  #50 load = 1; 
  #20 load = 0; 

  #100 dir = 0;  
  //#100 dir = 1;  // Start shifting right

  #50 load = 1; 
  #20 load = 0; // Ensure load is only active briefly

  #2000 $finish();

end

always #10 clk = ~clk;

endmodule