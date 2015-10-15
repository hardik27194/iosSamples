//
//  ViewController.m
//  FetchedResultsApp
//
//  Created by 島田 武史 on 2015/10/15.
//  Copyright © 2015年 島田 武史. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Susi.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize fetchedResultsController;
@synthesize managedObjectContext;

- (void)viewDidLoad {
  [super viewDidLoad];


//  NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Susi"];

  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  self.managedObjectContext = appDelegate.managedObjectContext;

  NSManagedObject *newObject = [NSEntityDescription insertNewObjectForEntityForName:@"Susi" inManagedObjectContext:self.managedObjectContext];
  [newObject setValue:@"uni" forKey:@"neta"];

  //  データを保存の実行
  NSError * error;
  [self.managedObjectContext save:&error];



}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
