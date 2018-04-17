#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Instruction{
	char op[16];
	int a;
	int b;
} Instruction;

void add_instruction(char* op, int a, int b);
int get_last_inst(void);

void readFile();

void executeInstruction();
