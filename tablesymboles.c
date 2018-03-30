#include "tablesymboles.h"

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

int find_symbol(Symbol* matrix, char name[CHAR_SIZE]){
	
	int i;

	for(i = 0; i < DEPTH; i++){
		if(strcmp(matrix[i].name, name) == 0){
			return i;
		}
	}

	return(EXIT_FAILURE);

}

int add_symbol(Symbol* matrix, char name[CHAR_SIZE], char type[CHAR_SIZE]){

	int i;

	if( find_symbol(matrix, name) != EXIT_FAILURE){
		printf("Error: variables with same name. \n");
		return(EXIT_FAILURE);
	}

	//create new symbol to add to the matrix
	Symbol new_symbol;
	if( strcpy(new_symbol.name,name) ==  NULL){
		printf("Error: STRCPY failed for name. \n");
		return(EXIT_FAILURE);
			
	}
	if( strcpy(new_symbol.type, type) ==  NULL){
		printf("Error: STRCPY failed for type. \n");
		return(EXIT_FAILURE);
			
	}
	new_symbol.value =  0;

	matrix[current] = new_symbol;
	current++;

	return(EXIT_SUCCESS);
}

int delete_symbol(Symbol* matrix, char name[CHAR_SIZE] ){

	int index = find_symbol(matrix, name);

	if( index == EXIT_FAILURE){
		printf("Error: variable does not exist. \n");
		return(EXIT_FAILURE);
	}

	matrix[index].name = "" ;
	matrix[index].type = "" ;
	matrix[index].value = -1;

	return(EXIT_SUCCESS);
}

void print_matrix(Symbol* matrix){
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


void main(){

	matrix = fill_matrix();
	add_symbol(matrix, "a", "int", 4);
	add_symbol(matrix, "a", "int", 5);
	add_symbol(matrix, "b", "int", 4);
	print_matrix(matrix);

}

























