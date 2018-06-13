#include "instr.h"

Instruction instr[1024];
int idx_inst;

int registers[12];
int memory[1024];


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

void printInst(Instruction inst_print){
	printf("Inst %s a %d b %d \n", inst_print.op, inst_print.a, inst_print.b); 
}

void readFile(){
	
	FILE *fptr;
	char * line = NULL;
	size_t len = 0;
    ssize_t read;
	char *token;


	fptr = fopen("instructions.s","r");

	if(fptr == NULL){
	  	printf("Error!");   
		fclose(fptr);
	  	return;             
	}

	while ((read = getline(&line, &len, fptr)) != -1) {

		Instruction new_inst;

	   	token = strtok(line," ");
		strcpy(new_inst.op, token);

	  	token = strtok(NULL, " ");
		new_inst.a = (int)*token-'0';

		token = strtok(NULL, " ");
		new_inst.b = (int)*token-'0';

		instr[idx_inst] = new_inst;
		
		idx_inst++;
    }

	fclose(fptr);

   	return;
}

void executeInstruction(int indexInst){

	if(strcmp(instr[indexInst].op, "ADD") == 0){
		registers[instr[indexInst].a] += registers[instr[indexInst].b] ;
	} else if(strcmp(instr[indexInst].op, "SUB") == 0){
		registers[instr[indexInst].a] -= registers[instr[indexInst].b] ;
	} else if(strcmp(instr[indexInst].op, "MUL") == 0){
		registers[instr[indexInst].a] *= registers[instr[indexInst].b] ;
	} else if(strcmp(instr[indexInst].op, "DIV") == 0){
		if( registers[instr[indexInst].b] != 0 ){
			registers[instr[indexInst].a] /= registers[instr[indexInst].b] ;
		}else{
			registers[instr[indexInst].a] = 0;
		}
	} else if(strcmp(instr[indexInst].op, "STORE") == 0){
		memory[instr[indexInst].a] = registers[instr[indexInst].b];
	} else if(strcmp(instr[indexInst].op, "LOAD") == 0){
		registers[instr[indexInst].a] = memory[instr[indexInst].b];
	} else if(strcmp(instr[indexInst].op, "AFC") == 0){
		registers[instr[indexInst].a] = instr[indexInst].b;
	} else if(strcmp(instr[indexInst].op, "EQU") == 0){
		if(registers[instr[indexInst].a] == registers[instr[indexInst].b]){
			registers[instr[indexInst].a] = 1;
		} else{
			registers[instr[indexInst].a] = 0;
		}
	} else if(strcmp(instr[indexInst].op, "INF") == 0){
		if(registers[instr[indexInst].a] < registers[instr[indexInst].b]){
			registers[instr[indexInst].a] = 1;
		} else{
			registers[instr[indexInst].a] = 0;
		}
	} else if(strcmp(instr[indexInst].op, "INFE") == 0){
		if(registers[instr[indexInst].a] <= registers[instr[indexInst].b]){
			registers[instr[indexInst].a] = 1;
		} else{
			registers[instr[indexInst].a] = 0;
		}
	} else if(strcmp(instr[indexInst].op, "SUP") == 0){
		if(registers[instr[indexInst].a] > registers[instr[indexInst].b]){
			registers[instr[indexInst].a] = 1;
		} else{
			registers[instr[indexInst].a] = 0;
		}
	} else if(strcmp(instr[indexInst].op, "SUPE") == 0){
		if(registers[instr[indexInst].a] >= registers[instr[indexInst].b]){
			registers[instr[indexInst].a] = 1;
		} else{
			registers[instr[indexInst].a] = 0;
		}
	} else if(strcmp(instr[indexInst].op, "JMP") == 0){
		indexInst = registers[instr[indexInst].a];
	} else if(strcmp(instr[indexInst].op, "JMPC") == 0){
		if(registers[instr[indexInst].b] == 0){
			indexInst= registers[instr[indexInst].a];
		}
	} 

}

void main(){
	idx_inst = 0;
	readFile();
	for(int i = 0; i < idx_inst; i++){
		printInst(instr[i]);
	}






	for(int i = 0; i < idx_inst; i++){
		executeInstruction(i);
	}

	printf("%d", registers[1]);
}













