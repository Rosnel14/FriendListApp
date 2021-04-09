//
//  LinkedList.h
//  LinkedList
//
//  Created by Rosnel Leyva-Cortés on 4/7/21.
//

#ifndef LinkedList_h
#define LinkedList_h




#import "ListNode.h"

 

@interface LinkedList<ObjectType>:NSObject

 

@property ListNode *head;

// inserts a node at the head of the list

-(void)add:(ObjectType)object;

 

// adds a value at an index

-(void)addObject:(ObjectType)object atIndex:(int)index;

 

//check is the linked list is empty

-(BOOL)isEmpty;

 

//clear the linked list

-(void)clear;

 

//print out every element in the list

-(void)print;

 

//returns true if the item is in the list, false otherwise

-(BOOL)isInList:(ObjectType)x;

 

//removes a node at a given index

-(void)deleteNodeAtIndex:(int)index;

 

//return the first node of the list

-(ListNode *)first;

 

//return the last node of the list.

-(ListNode *)last;

 

// returns the number of items in the list

-(int)count;

 

// returns a pointer to a node at the given index

-(ListNode *)nodeAt:(int)index;

 

// removes all occurrences of an item and returns the total number of items removed

// this can be done by using other previously written methods

-(int) removeOccurences:(ObjectType) item;

@end

#endif /* LinkedList_h */
