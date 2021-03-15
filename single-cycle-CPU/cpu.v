`include "control_unit.v"
`include "data_cache.v"
`include "alu_unit.v"
`include "ins_cache.v"
`include "regfile_unit.v"
`include "ext_unit.v"
`include "pc_unit.v"
`timescale 1ns / 1ps
 
module SingleCycleCPU(
    input clk, Reset,
	 output wire [5:0] opCode,
	 output wire [31:0] Out1, Out2, curPC, Result);
	 
	 wire [2:0] ALUOp;
	 wire [31:0] ExtOut, DMOut;
	 wire [15:0] immediate;
	 wire [4:0] rs, rt, rd;
	 wire zero, PCWre, PCSrc, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, RegOut;
	 
	 // module ALU(ReadData1, ReadData2, inExt, ALUSrcB, ALUOp, zero, result);
	 ALU alu(Out1, Out2, ExtOut, ALUSrcB, ALUOp, zero, Result);
	 // module PC(clk, Reset, PCWre, PCSrc, immediate, Address);
	 PC pc(clk, Reset, PCWre, PCSrc, ExtOut, curPC);
	 // module controlUnit(opCode, zero, PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp);
	 controlUnit control(opCode, zero, PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp);
	 // module dataMemory(DAddr, DataIn, DataMemRW, DataOut);
	 dataMemory datamemory(Result, Out2, DataMemRW, DMOut);
	 /* module instructionMemory(
    input [31:0] pc,
    input InsMemRW,
	 input [5:0] op, 
	 input [4:0] rs, rt, rd,
	 output [15:0] immediate);*/
	 instructionMemory ins(curPC, InsMemRW, opCode, rs, rt, rd, immediate);
	 // module registerFile(clk, RegWre, RegOut, rs, rt, rd, ALUM2Reg, dataFromALU, dataFromRW, Data1, Data2);
	 registerFile registerfile(clk, RegWre, RegOut, rs, rt, rd, ALUM2Reg, Result, DMOut, Out1, Out2);
    // module signZeroExtend(immediate, ExtSel, out);
	 signZeroExtend ext(immediate, ExtSel, ExtOut);
 
 
endmodule