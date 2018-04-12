#include "instr.h"

Instruction instr[1024];
int idx_inst;


void add_instruction(char* op, int a, int b){
	Instruction new_inst;
	strcpy(new_inst.op, op);
	new_inst.a = a;
	new_inst.b = b;

	instr[idx_inst] = new_inst;

	idx_inst++;
	
	return;
}

int get_last_inst(void){
	return(idx_inst-1);
}

void patcher(int last_inst, int new_adress){
	instr[last_inst].a = new_adress;
	return;
}

void printInst(Instruction inst_print){
	printf("Inst %s a %d b %d \n", inst_print.op, inst_print.a, inst_print.b); 
}
