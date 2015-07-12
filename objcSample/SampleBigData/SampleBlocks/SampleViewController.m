//
//  ViewController.m
//  SampleBlocks
//
//  Created by 島田武史 on 2014/11/11.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import "SampleViewController.h"
#import "User1.h"
#import "sampleCell.h"
#import "SampleTableViewController.h"

@interface SampleViewController ()

@end

@implementation SampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:0.6 green:1 blue:1 alpha:0.1];


    User1 *user = [User1 objectForPrimaryKey:@"user-000253041"];
    
    NSLog(@"user1 name  %@", user.name);
    NSLog(@"user1 addr1 %@", user.addr1);
    NSLog(@"user1 addr2 %@", user.addr2);
    
    CGRect sc = [[UIScreen mainScreen] bounds];
    
    CGRect rect = CGRectMake(0, 20+49, CGRectGetWidth(sc), 100);
    SampleCell *sampleCell = [[SampleCell alloc] initWithFrame:rect];
    
    [self.view addSubview:sampleCell];


    
    [self insertDb];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    UINavigationController *naviCon = [[UINavigationController alloc] init];

    SampleTableViewController *sampleTableViewController = [[SampleTableViewController alloc] init];
    [naviCon pushViewController:sampleTableViewController animated:YES];
    
}

-(void)insertDb
{
    
    
    NSDate *date = [NSDate date];
    NSLog(@"date1 : %@" , date);
    
    
    
    
    RLMRealm *realm =[RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteAllObjects];
    [realm commitWriteTransaction];
    
    
    NSMutableArray *users = [@[] mutableCopy];
    for (NSInteger i = 0; i < 10000000; i++)
    {
        User1 *user1 = [[User1 alloc] init];
        user1.name = [NSString stringWithFormat:@"user-%09ld",i];
        user1.addr1 = [NSString stringWithFormat:@"addr1-%09ld",i];
        user1.addr2 = [NSString stringWithFormat:@"addr2-%09ld",i];
        [users addObject:user1];
    }
    
    date = [NSDate date];
    NSLog(@"date2 : %@" , date);
    
    [realm beginWriteTransaction];
    [realm addObjects:users];
    [realm commitWriteTransaction];
    
    
    date = [NSDate date];
    NSLog(@"date3 : %@" , date);

}

@end
