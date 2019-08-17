`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:50:37 06/27/2019
// Design Name:   RegFile
// Module Name:   D:/Codes/Verilog/CPU/TestRegFile.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestRegFile;

	// Inputs
	reg [4:0] Rn1;
	reg [4:0] Rn2;
	reg [4:0] Wn;
	reg Write;
	reg Clock;
	reg [31:0] Wd;

	// Outputs
	wire [31:0] Out1;
	wire [31:0] Out2;

	// Instantiate the Unit Under Test (UUT)
	RegFile uut (
		.Rn1(Rn1), 
		.Rn2(Rn2), 
		.Wn(Wn), 
		.Write(Write), 
		.Clock(Clock), 
		.Wd(Wd), 
		.Out1(Out1), 
		.Out2(Out2)
	);
	
	reg [31:0] temp;
	initial begin
		// Initialize Inputs
		Rn1 = 0;
		Rn2 = 1;
		Wn = 1;
		Write = 1;
		Clock = 1;
		Wd = 0;
		temp = 0;

		// Wait 100 ns for global reset to finish
	end
	
	always begin
		#100;
		Clock = ~Clock;
		Write = Clock == 1? 1: 0;
	end	
	
	always begin
		#400;
		//Ҫд��ļĴ�����ţ�ÿ��100���룬Ҫд���Ŀ��Ĵ�����ż�1
		Wn = Wn + 1;
		//���ｫд���WdȡֵΪ4����Wn��ֵ
		//����һ��Temp��ʱ��������λ��չ
		temp = {28'h0, Wn};
		Wd = {temp[29:0], 2'b00};
		
		//����˿�A,Bָ����Ŀ��Ĵ����ı��+1
		Rn1 = Rn1 + 1;
		Rn2 = Rn2 + 1; 
 	end
endmodule

