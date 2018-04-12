#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#define DEPTH 2000
#define EXIT_SUCCESS 0
#define EXIT_FAIL -1
#define CHAR_SIZE 20

typedef struct Symbol{
	char name[CHAR_SIZE];
	char type[CHAR_SIZE];
	int value;
} Symbol;

Symbol* fill_matrix();
int get_last_address(void);
void dec_last_address(void);
void delete_matrix();
int find_symbol(char name[CHAR_SIZE]);
int set_value(char name[CHAR_SIZE], int value);
int get_value(char name[CHAR_SIZE]);
int add_symbol(char type[CHAR_SIZE], char name[CHAR_SIZE]);
int delete_symbol(int index);
void print_matrix();
