//
//  ViewController.m
//  autolayout2
//
//  Created by 島田 武史 on 2015/06/15.
//  Copyright (c) 2015年 島田 武史. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>


@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIView* baseView;
@property (nonatomic, weak) IBOutlet UIView* childView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {

  PFQuery *query  = [PFQuery queryWithClassName:@"temp1"];
  [query whereKey:@"col1" equalTo:@"row2"];

  //検索する
  NSArray *arrays = [query findObjects];
  for (PFObject *object in arrays) {
    NSLog(@" pfobject %@", object);
    NSLog(@" pfobject-col1 %@", object[@"col1"]);
  }



}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
