//
//  ViewController.m
//  MagicalRecordSample
//
//  Created by 島田 武史 on 2015/11/05.
//  Copyright © 2015年 AMoAd. All rights reserved.
//

#import "ViewController.h"
#import <MagicalRecord/MagicalRecord.h>
#import "User.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  [self saveData];

  [self fetchAllUser];

}

- (void)saveData {

  User *user = [User MR_createEntity];
  user.idx = @"1";
  user.name = @"taro";
  [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];

}

-(void)fetchAllUser {
  NSArray *users = [User MR_findAll];
  NSLog(@"users : %@", [users description]);

}



@end
