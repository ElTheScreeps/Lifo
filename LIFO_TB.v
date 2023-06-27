module LIFO_TB();

parameter data_width = 8;

reg                   clk;
reg                   rst_n;
reg                   write_en;
reg                   read_en;
reg  [data_width-1:0] data_in;

wire [data_width-1:0] data_out;
wire                  full;
wire                  empty;

always #5 clk = ~clk;

initial begin
clk = 0; 
data_in = 8'd0;
rst_n = 1;
write_en = 0;
read_en = 0; 
repeat(1) @(posedge clk);
rst_n = 0;
repeat(1) @(posedge clk);
rst_n = 1;
$display("Start testing");
write_en = 1; 
data_in = 8'd35;
repeat(1) @(posedge clk);
data_in = 8'd30;
repeat(1) @(posedge clk);
data_in = 8'd25;
repeat(1) @(posedge clk);
data_in = 8'd20;
repeat(1) @(posedge clk);
data_in = 8'd15;
repeat(1) @(posedge clk);
data_in = 8'd10;
repeat(1) @(posedge clk);
data_in = 8'd5;
repeat(1) @(posedge clk);
write_en = 0; 
read_en = 1;
repeat(10) @(posedge clk);
end

LIFO T(clk, rst_n, write_en, read_en, data_in, data_out, full, empty);

endmodule