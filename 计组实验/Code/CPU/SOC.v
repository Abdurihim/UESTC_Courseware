`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:54:33 06/24/2019 
// Design Name: 
// Module Name:    SOC 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module SOC(Clock, Reset,
					DISP_Seg, //�������ʾ��PC����2�ܣ���ALU����������4�ܣ�
					AN,  		 //����ѡ���ź�
					Test_signal,
					ALU_Result, Ext_imm, addr,Out1,Out2,Instruction,
					MemWr,MemtoReg);
					
	input Clock, Reset;
	output [7:0] DISP_Seg;
	output [5:0] AN;
	
	output [31:0] ALU_Result, Ext_imm, addr,Out1,Out2,Instruction;
	output MemWr,MemtoReg;
	
	output [23:0] Test_signal;
	reg [31:0] ClockNum = 0;
	
	wire MemWr,Step;
	wire [31:0] ALU_Result, Ext_imm,DataToWd,addr,MemOutData;
	
	assign Test_signal = {addr[9:2],ALU_Result[15:0]};
	assign LED0 = Step;
	
	always @(posedge Clock) ClockNum <= ClockNum + 1;
	
	//�������ʾ
	Hex7seg_decode seg(Test_signal,ClockNum[2:0],DISP_Seg,AN);
	
	//���棬������ȡ����
	DATA_MEM RAM(Out2,ALU_Result,MemWr,Clock,MemOutData);
	
	//ALU�ļ���������Ram�ж�ȡ��ֵ���ж�ѡһ��׼��������Ĵ����ѵ�Wd��
	MUX32_2_1 mux1 (ALU_Result, MemOutData,MemtoReg, DataToWd);
								
	//ROM��ͨ����ַ��ROM�л�ȡָ��							
	INST_ROM ROM(addr,Instruction);
	
	//CPU,��һ������Ϊָ��ڶ�������Ϊ�Ƿ�����PC��׼��д��Wd�����ֵ
	MIPS_CPU cpu(Instruction,Reset,Clock,DataToWd,
	//ALU���������ֵ��������������չ�����ֵ,PC,�Ĵ���������out2��datatoMem��
	ALU_Result,Ext_imm,addr,Out1,Out2,
	//MEM�������ź�
	MemWr,MemtoReg);

endmodule
