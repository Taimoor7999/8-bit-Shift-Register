module Shift_Register #(parameter N = 8) (clk, rst, load, din, dir, rin, q);

input clk, rst, load, dir, rin;
input [N-1 : 0] din;
output reg [N-1 : 0] q;

always @(posedge clk or posedge rst) begin
  if(rst) begin
    q <= 8'b00000000;
  end

  else if(load) begin
    q <= din;
  end

  else if(dir) begin
    q <= {q[N-2:0], rin};
  end

  else if(~dir) begin
    q <= {rin, q[N-1:1]};
  end  

end

endmodule