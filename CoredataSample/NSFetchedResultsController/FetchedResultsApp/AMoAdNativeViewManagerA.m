//
//  AMoAdNativeViewStb.m
//  FetchedResultsApp
//
//  Created by 島田 武史 on 2015/10/27.
//  Copyright © 2015年 島田 武史. All rights reserved.
//

#import "AMoAdNativeViewManagerA.h"
#import <UIKit/UIKit.h>


@interface AMoAdNativeViewManagerA ()
@property (nonatomic, strong) NSFetchedResultsController *originalFetchResult;
@end


@implementation AMoAdNativeViewManagerA

- (void)registerFetchResultWitdSid:(NSString *)sid
                      tag:(NSString *)tag
      originalFetchResult:(NSFetchedResultsController *)originalFetchResult {

  self.originalFetchResult = originalFetchResult;

}

- (id)fetchResultWitdSid:(NSString *)sid
                     tag:(NSString *)tag
                   indexPath:(NSIndexPath *)indexPath {

  if (indexPath.row % 3 == 0) {
    // ADの場合
    return @"AD Item";

  } else {
    // fetch result の場合

    //       :
    // なんかindexの計算をする。
    //       :

    return [self.originalFetchResult objectAtIndexPath:indexPath];

  }


}


@end
