module sign(timeout, enable, sign);

input [31:0] timeout;
input enable;
output reg sign;

initial sign =0;

always @ ( enable )
begin

if (enable)
sign = (timeout < 32'd200000 && timeout > 0)? 1:0;

else sign =0;

end

endmodule 