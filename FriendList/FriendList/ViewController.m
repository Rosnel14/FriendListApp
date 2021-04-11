//
//  ViewController.m
//  FriendList
//
//  Created by Rosnel Leyva-Cortés on 4/9/21.
//

#import "ViewController.h"
#import "ListNode.h"
#import "LinkedList.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

{
    Person * currentUser;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    currentUser = [[Person alloc]init];
}

- (IBAction)setName:(id)sender {
   currentUser.name = _nameBox.text;
}

- (IBAction)addFriendBtn:(id)sender {
    NSString * nameAdding = _addFriendBox.text;
    Person * friendAdding = [[Person alloc]initWithName:nameAdding];
    
    [currentUser addFriend:friendAdding];
}
- (IBAction)compileFriends:(id)sender { //this will take the friends in the friend list, and give them friends
    
    Person * Alice = [[Person alloc]initWithName:(NSString *)@"Alice"];
    Person * Bob = [[Person alloc]initWithName:(NSString *)@"Bob"];
    
    
    //for testing purposes I'm going to add Alice to the last friend's friend list
    //and bob to the first friend's friend list
    [[currentUser getFriend:currentUser.friends.last] addFriend:Alice];
    
    [[currentUser getFriend:currentUser.friends.first] addFriend:Bob];
}
- (IBAction)createInvitationList:(id)sender {
}

//the person passed into this method should be the user,
//i.e. this is the invitation list made for the users
//that contains their friends

-(NSMutableArray *)makeInvitationList: (Person *) Person{
    
    NSMutableArray * table = [[NSMutableArray alloc]init];
    
    ListNode * main = [[ListNode alloc]init]; //main pointer goes down main friend list
    ListNode * aux = [[ListNode alloc]init]; //auxilary pointer goes down the friend list of your friends
    

    main = Person.friends.head; //point to first node
    aux = [[Person getFriend:main].friends first]; //point to the first node in the friend list of the first friend

    for (int i = 0; i < [Person.friends count]-1; i++) {
        [table addObject:[Person getFriend:main]]; //store the first friend
        
        for(int i = 0; i< [[Person getFriend:main].friends count]-1; i++) { //go into the friend list of current friend
            [table addObject:[Person getFriend:aux]];
            
            aux = aux.next;
            
        }
        main = main.next;
        
        
}
    

    return table;
}

@end
