module sensor_interface(sensor1, sensor2, start, stop);

input sensor1, sensor2;
output reg start, stop;

always @( * )
begin

start= sensor2? 0 : sensor1;
stop = sensor2;

end

endmodule 