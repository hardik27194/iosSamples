//
//  tmpObject.m
//  SqliteSample
//
//  Created by 島田 武史 on 2015/11/05.
//  Copyright © 2015年 AMoAd. All rights reserved.
//

#import "DataObject.h"
#import "FMDatabase.h"

@implementation DataObject


-(FMDatabase *)db {
  NSArray*    paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
  NSString*   dir   = [paths objectAtIndex:0];
  FMDatabase* db    = [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:@"app.db"]];
  return db;
}

-(void)prepareDb
{
  FMDatabase* db = self.db;
  NSString*   sql = @"CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);";
  [db open];
  [db executeUpdate:sql];
  [db close];
}

-(void)insertdb {
  FMDatabase* db  = self.db;
  NSString*   sql = @"INSERT INTO users (name) VALUES (?)";
  [db open];
  [db executeUpdate:sql, @"taro"];
  [db executeUpdate:sql, @"jiro"];
  [db close];
}

-(void)selectdb {
  FMDatabase* db  = self.db;
  NSString*   sql = @"SELECT id, name FROM users;";
  [db open];
  FMResultSet*    results = [db executeQuery:sql];
  while([results next]) {
    int ID = [results intForColumnIndex:0];
    NSString* user = [results stringForColumnIndex:1];
    NSLog(@" %d, %@", ID , user);
  }
  [db close];
}

@end
