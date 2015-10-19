//
//  ViewController.h
//  FetchedResultsApp
//
//  Created by 島田 武史 on 2015/10/15.
//  Copyright © 2015年 島田 武史. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface ViewController : UIViewController<
NSFetchedResultsControllerDelegate,
UITableViewDataSource,
UITableViewDelegate
>
{
  NSFetchedResultsController *fetchedResultsController; // CoreData
  NSManagedObjectContext *managedObjectContext; // CoreData
}

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, retain) IBOutlet UITableView *tableView;


@end

