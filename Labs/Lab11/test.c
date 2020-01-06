#include "list.h"
#include <stdlib.h>
#include <limits.h>
#include <stdio.h>
#include <string.h>

int print_node(int x) {
    printf("%i, ", x);
    return x;
}

int main(void) {

    // Test create_list
    LIST *dllist = create_list();
    printf("Testing create_list()\n");
    printf("\texpected output: []\n");
    printf("\t  actual output: [");
    traverse(dllist, print_node);
    printf("]\n");
    printf("\texpected head ptr: 0x0\n");
    printf("\t  actual head ptr: %p\n", dllist->head);
    printf("\texpected tail ptr: 0x0\n");
    printf("\t  actual tail ptr: %p\n", dllist->tail);

    // Test push_front
    push_front(dllist, 5);
    push_front(dllist, 10);
    push_front(dllist, 15);
    push_front(dllist, 42);
    printf("Testing push_front()\n");
    printf("\texpected output: [42, 15, 10, 5, ]\n");
    printf("\t  actual output: [");
    traverse(dllist, print_node);
    printf("]\n");
    printf("\texpected head: 42\n");
    printf("\t  actual head: %i\n", dllist->head->data);
    printf("\texpected tail: 5\n");
    printf("\t  actual tail: %i\n", dllist->tail->data);
    
    // Test push_back
    push_back(dllist, 99);
    push_back(dllist, 7);
    printf("Testing push_back()\n");
    printf("\texpected output: [42, 15, 10, 5, 99, 7, ]\n");
    printf("\t  actual output: [");
    traverse(dllist, print_node);
    printf("]\n");
    printf("\texpected head: 42\n");
    printf("\t  actual head: %i\n", dllist->head->data);
    printf("\texpected tail: 7\n");
    printf("\t  actual tail: %i\n", dllist->tail->data);

    
    // Test pop_front
    printf("Testing pop_front()\n");
    printf("\texpected output: 42\n");
    printf("\t  actual output: %i\n", pop_front(dllist));
    printf("\texpected output: [15, 10, 5, 99, 7, ]\n");
    printf("\t  actual output: [");
    traverse(dllist, print_node);
    printf("]\n");
    printf("\texpected head: 15\n");
    printf("\t  actual head: %i\n", dllist->head->data);
    printf("\texpected tail: 7\n");
    printf("\t  actual tail: %i\n", dllist->tail->data);
    
    // Test empty_list
    printf("Testing empty_list()\n");
    empty_list(dllist);
    printf("\texpected output: []\n");
    printf("\t  actual output: [");
    traverse(dllist, print_node);
    printf("]\n");
    printf("\texpected head ptr: 0x0\n");
    printf("\t  actual head ptr: %p\n", dllist->head);
    printf("\texpected tail ptr: 0x0\n");
    printf("\t  actual tail ptr: %p\n", dllist->tail);
        
    // Test pop_front a second time
    printf("Testing pop_front() again\n");
    pop_front(dllist);
    printf("\texpected output: []\n");
    printf("\t  actual output: [");
    traverse(dllist, print_node);
    printf("]\n");
    printf("\texpected head ptr: 0x0\n");
    printf("\t  actual head ptr: %p\n", dllist->head);
    printf("\texpected tail ptr: 0x0\n");
    printf("\t  actual tail ptr: %p\n", dllist->tail);
    
    // Test pop_back
    push_back(dllist, 15);
    push_back(dllist, 42);
    printf("Testing pop_back()\n");
    printf("\texpected output: 42\n");
    printf("\t  actual output: %i\n", pop_back(dllist));
    printf("\texpected output: [15, ]\n");
    printf("\t  actual output: [");
    traverse(dllist, print_node);
    printf("]\n");
    printf("\texpected output: 15\n");
    printf("\t  actual output: %i\n", pop_back(dllist));
    printf("\texpected output: []\n");
    printf("\t  actual output: [");
    traverse(dllist, print_node);
    printf("]\n");
    
    /* Test popping empty lists*/
    empty_list(dllist);
    printf("Testing popping from empty lists\n");
    printf("\texpected output: -1\n");
    printf("\t  actual output: %i\n", pop_front(dllist));
    printf("\texpected output: -1\n");
    printf("\t  actual output: %i\n", pop_back(dllist));
    
    /* Test size */
    printf("Testing size()\n");
    printf("\texpected output: 0\n");
    printf("\t  actual output: %i\n", size(dllist));
    push_back(dllist, 0);
    push_back(dllist, 2);
    printf("\texpected output: 2\n");
    printf("\t  actual output: %i\n", size(dllist));
    push_back(dllist, 3);
    push_back(dllist, 4);
    push_back(dllist, 3000000);
    push_back(dllist, 7000000);
    printf("\texpected output: 6\n");
    printf("\t  actual output: %i\n", size(dllist));
    
    /* Test scale_up */
    printf("Testing scale_up()\n");
    scale_up(dllist);
    printf("\texpected output: [0, 2048, 3072, 4096, %i, %i, ]\n", INT_MAX, INT_MAX);
    printf("\t  actual output: [");
    traverse(dllist, print_node);
    printf("]\n");
        
    /* Testing over, clean up*/
    empty_list(dllist);
    free(dllist);
	
    printf("\nNote: passing all tests does not guarantee that you are not leaking memory, and thus does not guarantee a perfect score on the lab.\n");

    return 0;
}
