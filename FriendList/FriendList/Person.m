//
//  Person.m
//  FriendList
//
//  Created by Rosnel Leyva-Cortés on 4/9/21.
//

#import <Foundation/Foundation.h>
#import "ListNode.h"
#import "LinkedList.h"
#import "Person.h"

@implementation Person : NSObject

-(instancetype)init {
    self = [super init];
    if (self) {
        self.name = nil;
        self.friends = nil;
    }
    return self;
}

-(instancetype)initWithName:(NSString *) n {
    self = [super init];
    if (self) {
        self.name = n;
        self.friends = nil;
    }
    return self;
}

-(void)addFriend:(Person *)newFriend {
    if ([self friends] == nil) { //if list is empty, add at front
        [[self friends] add:newFriend];
    } else {
        [[self friends] rAdd:newFriend];
    }
}

-(void)removeFriend:(Person *)newFriend {
    ListNode * temp = [[ListNode alloc]init];
    temp = self.friends.head;
    
    for (int i = 0; i < [self.friends count]-1; i++) {
        if (temp.object == newFriend) {
            [self.friends deleteNodeAtIndex:i];
        }
        temp = temp.next;
    }
}

-(Person *)getFriend:(ListNode *)node {
    
    Person * friend = [[Person alloc]init];
    
    friend = node.object;
    
    return friend;
}


@end
