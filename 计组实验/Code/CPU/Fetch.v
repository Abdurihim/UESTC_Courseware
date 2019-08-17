`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:05:37 06/15/2019 
// Design Name: 
// Module Name:    Fetch 
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
module Fetch(
	input Reset,Clock,Jump,Branch,Zero,
	input [31:0] br_imm,Instruction,
	output [31:0]addr);
	 
	wire[31:0] pc_plus4,br_imm_ext,br_addr_extra,br_addr_result,jump_addr_result,next_pc;	
	wire [1:0] select;

	//��������ź�ȷ��ѡ���ź�
    assign select = (Jump) ?  2'b10 :(Branch & Zero) ?  2'b01 : 2'b00;
    //br_imm_ext��4��ɵ�ַ
	Left_2_Shifter Left2Shifter(br_imm, br_addr_extra);
	//pc + 4�õ���һ��
	ADD32 PCAdder(4,addr,pc_plus4);
	//ִ��pc + 4 + imm * 4�õ�Brachָ��ĵ�ַ
	ADD32 BrachAddrGetter(pc_plus4,br_addr_extra,br_addr_result);
	//ִ��PC����λ��Ins�ĵ�26λ��ӻ�ȡJumpָ��ĵ�ַ
	Joint_Addr JumpAddrGetter (addr,Instruction,jump_addr_result);
	//ѡ��ִ����һ��ָ�select=11�����������
	MUX32_4_1 NextPcGetter(pc_plus4,br_addr_result,jump_addr_result,32'h0,select,next_pc);
	//PC�����ģ��
	PC PC(Clock,Reset,next_pc,addr);

endmodule
