#include "tablesymboles.h"

int current;
Symbol* matrix;

/**
* @brief function that initializes the matrix (table)
* @param void
* @return address of allocated memory
*
*/
Symbol* fill_matrix(){
	current = 0;

	Symbol* matrix = (Symbol*)malloc(DEPTH*sizeof(Symbol));
	if( matrix == NULL ){
		printf("Error: memory allocation for matrix failed \n");
		
	}	
	
	return matrix;
}

int get_last_address(void){
	return(current-1);
}

void dec_last_address(void){
	current--;
	return;
}

int find_symbol(char name[CHAR_SIZE]){
	
	int i;

	for(i = 0; i < DEPTH; i++){
		if(strcmp(matrix[i].name, name) == 0){
			return i;
		}
	}

	return(EXIT_FAIL);

}

int set_value(char name[CHAR_SIZE], int value){
	
	int index = find_symbol(name);
	
	if(index == EXIT_FAIL){
		printf("Error: variable does not exist. \n");
		return(EXIT_FAIL);
	}
	
	matrix[index].value = value;

	return(EXIT_SUCCESS);

}

int get_value(char name[CHAR_SIZE]){
	int value = 0;
	
	int index = find_symbol(name);
	
	if(index == EXIT_FAIL){
		printf("Error: variable does not exist. \n");
		return(EXIT_FAIL);
	}
	
	value = matrix[index].value;

	return(value);

}

int add_symbol(char name[CHAR_SIZE], char type[CHAR_SIZE]){
	
	int i;

	if( matrix == NULL ){
		matrix = fill_matrix();
	}

	if( find_symbol(name) != EXIT_FAIL){
		printf("Error: variables with same name. \n");
		return(EXIT_FAIL);
	}

	//create new symbol to add to the matrix
	Symbol new_symbol;
	if( strcpy(new_symbol.name,name) ==  NULL){
		printf("Error: STRCPY failed for name. \n");
		return(EXIT_FAIL);
			
	}
	if( strcpy(new_symbol.type, type) ==  NULL){
		printf("Error: STRCPY failed for type. \n");
		return(EXIT_FAIL);
			
	}
	new_symbol.value =  0;

	matrix[current] = new_symbol;
	current++;

	return(EXIT_SUCCESS);
}

int delete_symbol(int index){

	if( index == EXIT_FAIL){
		printf("Error: variable does not exist. \n");
		return(EXIT_FAIL);
	}

	strcpy(matrix[index].name,"");
	strcpy(matrix[index].type,"");
	matrix[index].value = -1;
	current--;

	return(EXIT_SUCCESS);
}

void print_matrix(){
	int i;

	for(i = 0; i < current; i++){
		printf("Line %d: Name %s Type %s Value %d \n", i, matrix[i].name, matrix[i].type, matrix[i].value);
	}
}

void delete_matrix( Symbol *matrix){
	
	if( matrix == NULL){
		return;
	}

	free(matrix);
}

























