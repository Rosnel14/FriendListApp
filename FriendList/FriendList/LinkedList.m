//
//  LinkedList_.m
//  LinkedList
//
//  Created by Rosnel Leyva-Cortés on 4/7/21.
//

#import <Foundation/Foundation.h>
#import "ListNode.h"
#import "LinkedList.h"

@implementation LinkedList

// Add methods
-(void)add:(id)object { //add at head
    self.head = [[ListNode alloc] initWithObject:object];
}

-(void)rAdd:(id)object {//recursively add at end
    ListNode * new = [[ListNode alloc] init];
    new = self.head;
    
    [self rAddWrapper:new Object:object];
}

-(void)rAddWrapper:(ListNode *) node Object:(id)obj  {
    if( node.next == nil) { //base case, if there is nothing at the end add it!
        node.next = [[ListNode alloc] initWithObject:obj];
    } else {
        [self rAddWrapper:node.next Object:obj]; //step recursively to the next node
    }
    
}
//end of add methods


//addObject methods
-(void)addObject:(id)object atIndex:(int)index {
    ListNode * temp = self.head;
    ListNode * new = [[ListNode alloc] initWithObject:object];
    ListNode * temp1 = [[ListNode alloc] init];

    for(int i=0; i<index-1; i++) {
        temp = temp.next;
    }
    //first store original node
    temp1 = temp.next;
    
    //then set the node at desired index to be equal to new
    temp.next = new;
    
    //have the next node after new point to the old node, so that
    //the new node is now behind the old node
    temp.next.next = temp1;
    
}


-(void)RecurAddObject:(id)object atIndex:(int)index {
    ListNode * temp = [[ListNode alloc] init];
    temp = self.head;
    
    [self wrapperRecurAddObject:object atIndex:index node:temp];
  
}

-(void)wrapperRecurAddObject:(id)object atIndex:(int)index node:(ListNode *)temp {
    
    ListNode * new = [[ListNode alloc] initWithObject:object];
    ListNode * temp1 = [[ListNode alloc] init];
    
    if ([self returnIndex:temp] == index-1) { // base case
        //first store original node
        temp1 = temp.next;
        
        //then set the node at desired index to be equal to new
        temp.next = new;
        
        //have the next node after new point to the old node, so that
        //the new node is now behind the old node
        temp.next.next = temp1;
    } else { //step case
        [self wrapperRecurAddObject:object atIndex:index node:temp.next];
        
    }
}

//end of addObject methods

//isEmpty methods
-(BOOL)isEmpty {
    if ([self head] == NULL) {
        return true;
    } else {
        return false;
    }
}
//end of isEmpty methods

//clear methods
-(void)clear {
    
    ListNode * temp = self.head;
  
    while (temp != NULL) {
        temp = NULL;
        temp = temp.next;
    }
}

-(void)RecurClear {
    ListNode * temp = self.head;
    
    return [self wrapperRecurClear:temp];
}

-(void)wrapperRecurClear: (ListNode *) temp {
    
    //base case
    if (temp.next == nil) {
        temp = nil;
    } else { //step case
        [self wrapperRecurClear:temp.next];
    }
}

//end of clear methods

//print methods
-(void)print{
    ListNode * temp = self.head;
    while (temp != NULL) {
        NSLog(@"%@",temp.object);
        temp = temp.next;
    }
}

-(void)RecurPrint {
    ListNode * temp = self.head;
    return [self wrapperRecurPrint:temp];
}

-(void)wrapperRecurPrint: (ListNode *) temp {
    
    //base case
    if (temp.next == nil) {
        NSLog(@"%@",temp.object);
    } else { //step case
        NSLog(@"%@", temp.object);
        [self wrapperRecurPrint:temp.next];
    }
}


//end of print methods

//isinList methods
-(BOOL)isInList:(id)x {
    ListNode * temp = self.head;
    while(temp != NULL) {
        if (temp.object == x) {
            return true;
        } else {
            temp = temp.next;
        }
    } return false;
}

-(BOOL)RecurIsInList:(id)x {
    ListNode * temp = [[ListNode alloc] init];
    temp = self.head;
    
    return [self wrapperRecurIsInList:x node:temp];
}

-(BOOL)wrapperRecurIsInList:(id)x node:(ListNode *) temp {
    
    if (temp.object == x) { //base
        return true;
    } else { // step case
       return [self wrapperRecurIsInList:x node:temp.next];
    }
    return false;
}

//end of isinList methods


//deleteNodeat Index methods
-(void)deleteNodeAtIndex:(int)index {
    ListNode * temp = self.head;
    ListNode * temp1 = [[ListNode alloc]init];
    for (int i=0;i < index; i ++) {
        temp = temp.next;
    }
    //first store original node
    temp1 = temp.next;
    
    //then set the node at desired index to be removed
    temp.next = NULL;
    
    //have the next node after new point to the old node, so that
    //the new node is now behind the old node
    temp.next.next = temp1;
}

-(void)RecurDeleteNodeAtIndex:(int)index {
    ListNode * temp = [[ListNode alloc] init];
    temp = self.head;
    
    [self wrapperRecurDeleteNodeAtIndex:index node:temp];
}

-(void)wrapperRecurDeleteNodeAtIndex:(int)index node:(ListNode *)temp {
    
    //base case
    if ([self returnIndex:temp] == index) {
        ListNode * temp1 = [[ListNode alloc]init];
        
        //first store original node
        temp1 = temp.next;
        
        //then set the node at desired index to be removed
        temp.next = NULL;
        
        //have the next node after new point to the old node, so that
        //the new node is now behind the old node
        temp.next.next = temp1;
        
    } else { //step case
        [self wrapperRecurDeleteNodeAtIndex:index node:temp.next];
    }
}

//end of deleteNodeat Index methods

//first methods
-(ListNode *) first {
    return [self head];
}
//end of first methods


//last methods
-(ListNode *) last {
    ListNode * temp = self.head;
    while (temp.next != NULL) {
        temp = temp.next;
    }
    return temp;
}

-(ListNode *) RecurLast {
    
    ListNode * temp = self.head;
    
    return [self wrapperRecurLast:temp];
}

-(ListNode *) wrapperRecurLast: (ListNode *) temp {
    
    //base case
    if (temp.next == nil) {
        return temp;
    } else {//step case
        
        return [self wrapperRecurLast:temp.next];
    }
}

//end of last methods

//count methods
-(int)count {
    ListNode * temp = self.head;
    int counter = 0;
    while (temp != NULL) {
        temp = temp.next;
        counter++;
    }
    return counter;
}

-(int)RecurCount {
    ListNode * temp = self.head;
    
    return [self wrapperRecurCount:temp];
}

-(int)wrapperRecurCount: (ListNode *) temp {
    
    //base case
    if (temp.next == nil) {
        return 1;
    } else { //step case
        return 1+[self wrapperRecurCount:temp.next];
    }
}

//end of count methods

 //nodeAt method
-(ListNode *)nodeAt:(int)index {
    ListNode * temp = self.head;
    for (int i=0;i < index; i ++) {
        temp = temp.next;
    }
    return temp;
}

//end of nodeAt method

//return index method

-(int)returnIndex:(ListNode *)node {
    int counter = 0;
    ListNode * temp = [[ListNode alloc]init];
    temp = self.head;
    for (int i=0; i <[self count]-1; i++) {
        if (node == temp) {
            return counter;
        } else {
            counter++;
            temp = temp.next;
        }
    }
    return -1;
}

//end of return index method

//removeOccur method

-(int)removeOccurences:(id)item {
    ListNode * temp = self.head;
    int counter = 0;
    while (temp.next != NULL) {
        if (temp.object == item) {
            temp.object = 0; //going to make 0, be an empty data obj
            counter++;
        }
        temp = temp.next;
    }
    return counter;
}


-(int)RecurRemoveOccurences:(id)item {
    ListNode * temp = self.head;
   
   return [self wrapperRecurRemoveOccurences:item node:temp];
    
}

-(int)wrapperRecurRemoveOccurences:(id)item node:(ListNode *)temp  {
    int counter = 0;
    
    if (temp.next == nil) { // base case
        return counter;
    } else { // step case
        
        if (temp.object == item) {
            temp.object = 0; //going to make 0, be an empty data obj
            counter++;
        }
        return counter+[self wrapperRecurRemoveOccurences:item node:temp.next];
    }
}
//end of remove Occur method

//start of reverse list method

-(void)reverseList {
    
    //iterative pointers
    ListNode * previous = [[ListNode alloc] init];
    ListNode * current = [[ListNode alloc]init];
    ListNode * next = [[ListNode alloc]init];
    
    previous = nil;
    current = self.head;
    next = nil;
    
    while (current != nil)  {
        
        //move ahead by one node in the list
        next = current.next;
        
        //this reverses the next pointers in reverse
        current.next = previous;
        
        //this will move the previous pointer all the way until
        //the end of the list
        previous = current;
        
        //this will move the current pointer ahead by one
        current = next;
    }
    
    //by the end the two other pointers should point to nil
    //then previous is point to the last node obj, so just
    //set this equal to self.head and list is reversed
    self.head = previous;
}

//end of reverse list method

@end
