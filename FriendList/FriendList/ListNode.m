//
//  ListNode.m
//  LinkedList
//
//  Created by Rosnel Leyva-Cortés on 4/7/21.
//

#import <Foundation/Foundation.h>
#import "ListNode.h"

@implementation ListNode : NSObject

//test commit

- (instancetype)initWithObject:(id)object {
    self = [super init];
    if (self) {
        self.object = object;
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    return self;

}

- (instancetype)initWithObject:(id)object andNextNode:(ListNode *)node {
    self = [super init];
    if (self) {
        self.object = object;
        self.next = node;
    }
    return self;

}

@end
