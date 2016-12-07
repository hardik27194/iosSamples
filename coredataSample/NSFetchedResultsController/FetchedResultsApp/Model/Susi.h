//
//  Susi.h
//  FetchedResultsApp
//
//  Created by 島田 武史 on 2015/10/15.
//  Copyright © 2015年 島田 武史. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Susi : NSManagedObject
@property (nullable, nonatomic, retain) NSString *variety;
@property (nullable, nonatomic, retain) NSString *neta;
@end

NS_ASSUME_NONNULL_END


