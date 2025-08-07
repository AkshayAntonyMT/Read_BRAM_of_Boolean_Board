`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2025 06:13:43 PM
// Design Name: 
// Module Name: read_bram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module read_bram(
input clk,
output wire [7:0] dout
    );
    
    reg [18:0] addr = 0;
    reg [7:0] stage1= 0, stage2 = 0;
    wire [7:0] data;
    wire ena = 1'b1;
    wire wea = 1'b0;
    wire [7:0] dina = 8'd0;


blk_mem_gen_0 r1 (
        .clka(clk),
        .ena(ena),
        .wea(wea),
        .addra(addr),
        .dina(dina),
        .douta(data)
    );


  always @(posedge clk) 
        begin
        if (addr < 19'd262144)
                addr <= addr + 1;
        else
                addr <= 0;  // restart if you want continuous loop

        stage1 <= data;
        stage2<= stage1;
        end

    assign dout =  stage2;
endmodule
