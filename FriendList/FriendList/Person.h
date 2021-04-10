//
//  Person.h
//  FriendList
//
//  Created by Rosnel Leyva-Cortés on 4/9/21.
//

#ifndef Person_h
#define Person_h


#import "ListNode.h"
#import "LinkedList.h"

@interface Person : NSObject

@property NSString * name;

@property LinkedList * friends;

-(instancetype)init;

-(instancetype)initWithName:(NSString *) n;

-(void)addFriend:(Person *)newFriend;

//sad method
-(void)removeFriend:(Person *)newFriend;






@end

#endif /* Person_h */
