module counter(clk, enable, reset, count);

input clk, enable, reset;
output reg [31:0] count;

initial count = 0;

always @ (posedge clk)
begin

if (enable)
count = reset? 0 : count+1;


end


endmodule 