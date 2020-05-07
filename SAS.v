module SAS(sensor1, sensor2, clk, led);

input sensor1, sensor2, clk;
output led;

wire start, stop, count_reset, count_enable, sing_enable;
wire [31:0] count;
wire [31:0] sign_timeout;

sensor_interface Sensor(sensor1, sensor2, start, stop);
FSM SM(clk, start, stop, count, count_reset, count_enable, sign_timeout, sign_enable);
counter Counter(clk, count_enable, count_reset, count);
sign Sign(sign_timeout, sign_enable, led);

endmodule 