module FSM(clk, start, stop, count, count_reset, count_enable, sign_timeout, sign_enable);

input clk, start, stop;
input [31:0] count;

output reg count_reset, count_enable, sign_enable;
output reg [31:0] sign_timeout;


reg [1:0] current_state, next_state;

localparam 	IDLE = 2'd0,
			START = 2'd1,
			STOP = 2'd2,
			DISPLAY = 2'd3;
			
			
initial current_state = IDLE;


always @ (posedge clk)
begin
current_state=next_state;
end

always @ ( current_state, start, stop )
begin

case (current_state)
		IDLE: begin
		count_enable=0;
		count_reset=1;
		sign_enable=0;
		sign_timeout=0;
		next_state = start? START:IDLE;
		end
		START: begin
		count_enable=1;
		count_reset=0;
		sign_enable=0;
		sign_timeout=0;
		next_state = stop? STOP:START;
		end
		STOP: begin
		count_enable=0;
		count_reset=0;
		sign_enable=0;
		sign_timeout=count;
		next_state = DISPLAY;
		end
		DISPLAY: begin
		count_enable=0;
		count_reset=0;
		sign_enable=1;
		sign_timeout=count;
		next_state = start? IDLE:DISPLAY;
		end
endcase


end

endmodule 