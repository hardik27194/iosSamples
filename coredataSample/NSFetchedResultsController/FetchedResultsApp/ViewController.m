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

  //sdf
  self.nativeViewManagerMock = [[AMoAdNativeViewManagerMock alloc] init];


  [NSFetchedResultsController deleteCacheWithName:nil];

  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  self.managedObjectContext = appDelegate.managedObjectContext;

  // データ削除
  [self deleteAllData];

  // データ登録
  [self registerData];

  // データ参照
  [self readData];

  // perform fetch
  NSError *error;
  if (![[self fetchedResultsController] performFetch:&error]) {
    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    abort();
  }

  //sdf fetchResult を登録
  self.nativeViewManagerMock = [[AMoAdNativeViewManagerMock alloc] init];
  [self.nativeViewManagerMock registerFetchResultWitdSid:@"sid" tag:@"tag" originalFetchResult:fetchedResultsController];

}

#pragma mark -- read/save data
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
    NSLog(@" susi.variety %@", susi.variety);
  }

}

-(void)registerData {

  [self registerOneData:@"マグロ" section:@"握り"];
  [self registerOneData:@"コハダ" section:@"握り"];
  [self registerOneData:@"コハダ2" section:@"握り"];
  [self registerOneData:@"コハダ3" section:@"握り"];
  [self registerOneData:@"コハダ4" section:@"握り"];
  [self registerOneData:@"コハダ5" section:@"握り"];
  [self registerOneData:@"コハダ6" section:@"握り"];
  [self registerOneData:@"コハダ7" section:@"握り"];
  [self registerOneData:@"コハダ8" section:@"握り"];
  [self registerOneData:@"かんぴょう" section:@"巻き"];
  [self registerOneData:@"納豆" section:@"巻き"];
  [self registerOneData:@"ウニ" section:@"軍艦"];
  [self registerOneData:@"イクラ" section:@"軍艦"];

}

-(void)registerOneData:(NSString*)string section:(NSString *)section {

  NSError * error;

  NSManagedObject *newObject = [NSEntityDescription insertNewObjectForEntityForName:@"Susi" inManagedObjectContext:self.managedObjectContext];

  [newObject setValue:section forKey:@"variety"];
  [newObject setValue:string forKey:@"neta"];
  [self.managedObjectContext save:&error];

}

-(void)deleteAllData {

  //削除対象のフェッチ情報を生成
  NSFetchRequest *deleteRequest = [[NSFetchRequest alloc] init];
  [deleteRequest setEntity:[NSEntityDescription entityForName:@"Susi" inManagedObjectContext:managedObjectContext]];
  [deleteRequest setIncludesPropertyValues:NO]; //managed object IDのみフェッチ

  NSError *error = nil;

  //生成したフェッチ情報からデータをフェッチ
  NSArray *results = [managedObjectContext executeFetchRequest:deleteRequest error:&error];
  //[deleteRequest release]; //ARCオフの場合

  //フェッチしたデータを削除処理
  for (NSManagedObject *data in results) {
    [managedObjectContext deleteObject:data];
  }

  NSError *saveError = nil;

  //削除を反映
  [managedObjectContext save:&saveError];

}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [[fetchedResultsController sections] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  if ([[fetchedResultsController sections] count] > 0) {
    id <NSFetchedResultsSectionInfo> sectionInfo = [[fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo name];
  } else
    return nil;
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
  if ([[fetchedResultsController sections] count] > 0) {
    id <NSFetchedResultsSectionInfo> sectionInfo = [[fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
  } else
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

  id returnObject = [self.nativeViewManagerMock fetchResultWitdSid:@"sid" tag:@"tag" indexPath:indexPath];


  if ([returnObject isKindOfClass:[NSString class]]) {
    NSLog(@" AD!   amoad view item   ");

    CustomCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCellID" forIndexPath:indexPath];
    cell.nedaLabel.text = @"amoad view!!!";
    return cell;

  } else {
    if ([returnObject isKindOfClass:[Susi class]]) {

      CustomCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCellID" forIndexPath:indexPath];
      Susi *susi = (Susi *)returnObject;
      cell.nedaLabel.text = [NSString stringWithFormat:@"%@", susi.neta];

      return cell;

    } else {
      NSLog(@" arienai");
    }
  }

  return nil;
  
}

#pragma mark -- fetchResultsController
- (NSFetchedResultsController *)fetchedResultsController {

  if (fetchedResultsController != nil) {
    return fetchedResultsController;
  }

  // Create and configure a fetch request with the Book entity.
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:@"Susi" inManagedObjectContext:self.managedObjectContext];
  [fetchRequest setEntity:entity];

  // Create the sort descriptors array.
  NSSortDescriptor *authorDescriptor = [[NSSortDescriptor alloc] initWithKey:@"variety" ascending:YES];
  NSSortDescriptor *titleDescriptor = [[NSSortDescriptor alloc] initWithKey:@"neta" ascending:YES];
  NSArray *sortDescriptors = @[authorDescriptor, titleDescriptor];
  [fetchRequest setSortDescriptors:sortDescriptors];

  // Create and initialize the fetch results controller.
  fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:@"variety" cacheName:@"Root"];
  fetchedResultsController.delegate = self;

  return fetchedResultsController;

}

@end
