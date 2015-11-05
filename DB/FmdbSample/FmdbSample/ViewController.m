//
//  ViewController.m
//  FmdbSample
//
//  Created by 島田 武史 on 2015/11/02.
//  Copyright © 2015年 AMoAd. All rights reserved.
//

#import "ViewController.h"
#import "DataObject.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

}

-(void)viewDidAppear:(BOOL)animated {
  DataObject *dataObject = [[DataObject alloc] init];

//  [dataObject prepareDb];
//  [dataObject insertdb];
  [dataObject selectdb];

}


@end
