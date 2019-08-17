`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:14:16 06/28/2019
// Design Name:   ALU
// Module Name:   D:/Codes/Verilog/CPU/TestALU.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestALU;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [2:0] ALU_Ctr;

	// Outputs
	wire [31:0] Result;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.ALU_Ctr(ALU_Ctr), 
		.Result(Result), 
		.Zero(Zero)
	);

	initial begin
		A = 32'h000000ff;
		B = 32'h000000cc;
		ALU_Ctr = 111;//��ʼΪ111����ʱ����ȫ0
		#100;
		ALU_Ctr = 3'b000;//���Լӷ�
		#100;
		ALU_Ctr = 3'b100;//���Լ���
		#100;
		ALU_Ctr = 3'b001;//������
		#100;
		ALU_Ctr = 3'b101;//���Ի�
		#100;
		ALU_Ctr = 3'b010;//�������
		#100;
		ALU_Ctr = 3'b110;//����B������16λ
		#100;
		B = 32'h000000ff;
		ALU_Ctr = 3'b100;//����0��־λ
	end
      
endmodule

