#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#define DEPTH 2000
#define EXIT_SUCCESS 0
#define CHAR_SIZE 20

typedef struct Symbol{
	char name[CHAR_SIZE];
	char type[CHAR_SIZE];
	int value;
} Symbol;

int current;
Symbol* matrix;

Symbol* fill_matrix();
void delete_matrix(Symbol* matrix);
int find_symbol(Symbol* matrix, char name[CHAR_SIZE]);
int add_symbol(Symbol* matrix, char type[CHAR_SIZE], char name[CHAR_SIZE]);
int delete_symbol(Symbol* matrix, char name[CHAR_SIZE] );
void print_matrix(Symbol* matrix);
void main();
