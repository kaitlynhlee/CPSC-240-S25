#include <stdio.h>

extern void swap(double *a, double *b);  // Declare the assembly swap function

double* sort(double arr[]) {
    int i, j;
    for (i = 0; i < 5; i++) {
        for (j = 0; j < 5 - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                swap(&arr[j], &arr[j + 1]);  // Call assembly swap function
            }
        }
    }
    return arr;
}
