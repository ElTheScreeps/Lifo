module LIFO(clk, rst_n, write_en, read_en, data_in, data_out, full, empty);

parameter data_width = 8;

input                       clk; 
input                       rst_n;
input                       write_en;
input                       read_en;
input      [data_width-1:0] data_in;
output reg [data_width-1:0] data_out;
output                      full; 
output                      empty;
  
reg [3:0] count;
reg [data_width-1:0] memory [data_width-1:0];

assign full = (count == 4'b1000) ? 1 : 0;
assign empty = (count == 4'b0000) ? 1 : 0;

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n) begin
        memory[0] <= 0; 
        memory[1] <= 0; 
        memory[2] <= 0; 
        memory[3] <= 0;
        memory[4] <= 0; 
        memory[5] <= 0; 
        memory[6] <= 0; 
        memory[7] <= 0;
        data_out  <= 0; 
        count     <= 1;
    end
    else if (write_en & full == 0) begin
        memory[count] <= data_in;
        count <= count + 1;
    end
    else if (read_en & empty == 0) begin
        data_out <= memory[count];
        count <= count - 1;
    end
end

endmodule