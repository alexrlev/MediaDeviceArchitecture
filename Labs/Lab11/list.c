#include <stdlib.h>
#include <stdio.h>
#include <limits.h>
#include <math.h>
#include "list.h"

// Prototypes for static functions
static NODE *create_node(int data);

/** create_list
  *
  * Creates a list by allocating memory for it on the heap.
  * Be sure to initialize head and tail to NULL.
  *
  * @return pointer to an empty linked list
  */
LIST *create_list(void) {
  LIST *plist;
  plist = malloc(sizeof(LIST));
  if (plist == NULL) {
      printf("Failed to allocate memory for list");
      exit(EXIT_FAILURE);
  }
  plist->head = NULL;
  plist->tail = NULL;

  return plist;
}

/** create_node
  *
  * Helper function that creates a node by allocating memory for it on the heap.
  * Be sure to set its pointers to NULL and to set the data
  *
  * @param data an integer to store in the list
  * @return pointer to a node
  */
static NODE *create_node(int data) {
  NODE *pnode;
  pnode = malloc(sizeof(NODE));
  if (pnode == NULL) {
      printf("Failed to allocate memory for node");
      exit(EXIT_FAILURE);
  }
  pnode->data = data;
  pnode->prev = NULL;
  pnode->next = NULL;

  return pnode;
}

/** push_front
  *
  * Adds the data to the front of the linked list
  *
  * @param dllist a pointer to the list
  * @param data an integer to store in the list
  */
void push_front(LIST *dllist, int data) {
  NODE* node = create_node(data);

  if (dllist->head != NULL) {
      node->next = dllist->head;
      dllist->head->prev = node;
  } else {
      dllist->tail = node;
  }
  dllist->head = node;
}

/** push_back
  *
  * Adds the data to the end of the linked list
  *
  * @param dllist a pointer to the list.
  * @param data an integer to store in the list
  */
void push_back(LIST *dllist, int data) {
    // TODO 1.0: Complete this function
    // Make sure you update the tail pointer and the size
    // Don't forget to handle the empty list case!
    NODE* node = create_node(data);
    if (dllist->head == NULL) { 
      dllist->head = node;
    } else {
      node->prev = dllist->tail;
      dllist->tail->next = node;
    }
    dllist->tail = node;
    return;
}

/** pop_front
  *
  * Removes the node at the front of the linked list and returns its value.
  * Popping an empty list returns -1
  *
  * @param dllist a pointer to the list.
  */
int pop_front(LIST *dllist) {
    // TODO 2.0: Complete this function
    // Make sure you update the head pointer and the size
    // Don't leak memory!
    // Don't forget to handle the empty list case!
  int headData = -1;
  if (size(dllist) == 1) {
    headData = dllist->head->data;
    dllist->head = NULL;
    dllist->tail = NULL;
  } else if (dllist->head != NULL) { 
    headData = dllist->head->data;
    dllist->head = dllist->head->next;
  }
  return headData;
}

/** pop_back
  *
  * Removes the node at the back of the linked list
  *
  * Popping an empty list returns -1
  * @param dllist a pointer to the list.
  */
int pop_back(LIST *dllist) {
    // TODO 2.2: Complete this function
  int tailData = -1;
  if (size(dllist) == 1) {
    tailData = dllist->tail->data;
    dllist->head = NULL;
    dllist->tail = NULL;
  } else if (dllist->tail != NULL) { 
    tailData = dllist->tail->data;
    dllist->tail = dllist->tail->prev;
    dllist->tail->next = NULL;
  }
  return tailData;
}

/** size
  * Gets the number of nodes in the linked list
  *
  * @param dllist a pointer to the list
  * @return The size of the linked list
  */
int size(LIST *dllist) {
    // TODO 3.0: Complete this function. It should run in O(n) time.
  int length = 0;
  if (dllist->head == NULL) {
    return length;
  } else {
    NODE* current = dllist->head;
    while(current != NULL) {
      length++;
      current = current->next;
    }
  }
  return length;
}

/** empty_list
  *
  * Empties the list.  After this is called, the list should be empty.
  *
  * @param dllist a pointer to a linked list.
  *
  */
void empty_list(LIST *dllist) {
  // TODO 2.1: Complete this function using pop_front
  while (dllist->head != NULL) {
    pop_front(dllist);
  }
  return;
}

/** traverse
  *
  * Traverses the linked list calling a function on each node's data to modify
  * that node's data.
  *
  * @param dllist a pointer to a linked list.
  * @param function a function that does something to each node's data.
  */
void traverse(LIST *dllist, list_operation function) {
  NODE *p = dllist->head;

  while (p != NULL) {
      p->data = function(p->data);
      p = p->next;
  }
}

// TODO 4.1: Add your helper function here.
// You can assume all ints passed in are positive.
// scale up by 1024(2^10)
// bitshitft << 1 is multipying by two
int sacle_up_help(int x) {
  if (x > INT_MAX >> 10) {
    return INT_MAX;
  }
  return x << 10;
}




/** scale_up
  *
  * Scales each number in the list up by a factor of 1024 (2^10) times for
  * use in fixed point physics math.
  *
  * NOTE! if a number would be larger than the maximum value of a signed int
  *       after scaling, scale_up replaces the number with INT_MAX from
  *       limits.h instead of scaling it.
  *
  * @param dllist a pointer to a linked list.
  */
void scale_up(LIST *dllist) {
  // TODO 4.0: Complete this function.
  // HINT: This is a traversal problem. test.c has an example of traversing.
  traverse(dllist, sacle_up_help);
  return;
}
