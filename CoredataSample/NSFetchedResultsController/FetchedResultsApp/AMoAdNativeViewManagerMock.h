//
//  AMoAdNativeViewStb.h
//  FetchedResultsApp
//
//  Created by 島田 武史 on 2015/10/27.
//  Copyright © 2015年 島田 武史. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface AMoAdNativeViewManagerMock : NSObject


- (void)registerFetchResultWitdSid:(NSString *)sid
                               tag:(NSString *)tag
               originalFetchResult:(NSFetchedResultsController *)originalFetchResult;

- (id)fetchResultWitdSid:(NSString *)sid
                     tag:(NSString *)tag
               indexPath:(NSIndexPath *)indexPath ;


@end
