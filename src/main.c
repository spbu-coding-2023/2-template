#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_SIZE_OF_ARRAY_SORT 100

void sort_pyramid(long long input_sort[], int input_count);

int input(long long sorted[MAX_SIZE_OF_ARRAY_SORT], long long not_sorted[MAX_SIZE_OF_ARRAY_SORT], int from_count, int to_count, long long from_value, long long to_value){
	char space;
	long long buffer; 
	int value_of_numbers_for_sort = 0;
	for (int i = 0; i < MAX_SIZE_OF_ARRAY_SORT; i++) {
		scanf("%lld%c", &buffer, &space);
		if ((from_count == 1 && buffer <= from_value) || (to_count == 1 && buffer >= to_value)) {
			if (from_count == 1 && buffer <= from_value) 
				fprintf(stdout,"%lld ", buffer);
			if (to_count == 1 && buffer >= to_value) 
				fprintf(stderr,"%lld ", buffer);
		}
		else {
			sorted[value_of_numbers_for_sort] = buffer;
			not_sorted[value_of_numbers_for_sort] = buffer;
			value_of_numbers_for_sort++;
		}
		if (space != ' ') break;
	}
	return value_of_numbers_for_sort;
}

int main(int argc, char** argv) {
	long long from_value = 0, to_value = 0;
	int from_count = 0, to_count = 0;
	if (argc < 2) return -1;
	if (argc > 3) return -2;
	for (int i = 1; i < argc; i++) {
		if ((strncmp(argv[i],"--from=", 7)) == 0)  {
			from_value = atol(argv[i]+7);
			from_count++;
		}
		else if ((strncmp(argv[i],"--to=", 5)) == 0){
			to_value = atol(argv[i]+5);
			to_count++;
		}
	}
	if (from_count > 1 || to_count > 1) return -3;
	if (from_count == 0 && to_count == 0) return -4;
	long long sorted[MAX_SIZE_OF_ARRAY_SORT];
	long long not_sorted[MAX_SIZE_OF_ARRAY_SORT];
	int value_of_numbers_for_sort = input(sorted, not_sorted, from_count, to_count, from_value, to_value);
	sort_pyramid(sorted, value_of_numbers_for_sort);
	int return_value=0;
	for (int i = 0; i < value_of_numbers_for_sort; i++) {
		if(sorted[i] != not_sorted[i]) return_value++;
	}
	return return_value;
}
