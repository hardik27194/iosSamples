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

#import "CustomCellTableViewCell.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize fetchedResultsController;
@synthesize managedObjectContext;

- (void)viewDidLoad {
  [super viewDidLoad];

//  UINib *nib = [UINib nibWithNibName:@"CustomCellID" bundle:nil];
//  [self.tableView registerNib:nib forCellReuseIdentifier:@"CustomCellID"];


  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  self.managedObjectContext = appDelegate.managedObjectContext;

  // データ登録
  [self registerData];


  // データ参照
  [self readData];

}

-(void)readData {

  NSFetchRequest *request = [[NSFetchRequest alloc] init];
  NSEntityDescription *description = [NSEntityDescription entityForName:@"Susi" inManagedObjectContext:self.managedObjectContext];
  [request setEntity:description];


  /*
  // 検索条件を指定
  NSPredicate * predicate = [NSPredicate predicateWithFormat:@"(name = %@)",@"hryk224"];
  [request setPredicate:predicate];
   */

  NSError *error;
  NSArray *objects = [self.managedObjectContext executeFetchRequest:request error:&error];
  NSLog(@" objects %@", objects);

  for (Susi *susi in objects) {
    NSLog(@" susi.neta %@", susi.neta);
  }


}

-(void)registerData {

  [self registerOneData:@"uni"];
  [self registerOneData:@"ikura"];
  [self registerOneData:@"toro"];

}

-(void)registerOneData:(NSString*)string {
  NSManagedObject *newObject = [NSEntityDescription insertNewObjectForEntityForName:@"Susi" inManagedObjectContext:self.managedObjectContext];
  NSError * error;
  [newObject setValue:string forKey:@"neta"];
  [self.managedObjectContext save:&error];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

  CustomCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCellID" forIndexPath:indexPath];

  return cell;

}



@end
