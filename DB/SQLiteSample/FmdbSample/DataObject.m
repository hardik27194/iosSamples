//
//  tmpObject.m
//  SqliteSample
//
//  Created by 島田 武史 on 2015/11/05.
//  Copyright © 2015年 AMoAd. All rights reserved.
//

#import "DataObject.h"
#import <sqlite3.h>

@implementation DataObject

-(NSString *)database_filename{
  return @"database.sqlite";
}

-(NSString *)database_path{
  NSString *work_path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
  NSString *database_path = [NSString stringWithFormat:@"%@/%@", work_path, self.database_filename];
  return database_path;
}

-(void)prepareDb
{

  NSFileManager *manager = [NSFileManager defaultManager];
  if (![manager fileExistsAtPath:self.database_path]) {
    NSError *error = nil;
    NSString *template_path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.database_filename];

    if (![manager copyItemAtPath:template_path toPath:self.database_path error:&error]) {
      NSLog(@"db file error!");
    }
  }

}

/*
 create table user(id int primary key, name text);
 insert into user values (1,"taro");
 insert into user values (2,"ziro");
 insert into user values (3,"sabu");
*/


-(void)selectDB {

  sqlite3 *sqlax;

  BOOL isSuccessfullyOpened = sqlite3_open([self.database_path UTF8String], &sqlax);
  if (isSuccessfullyOpened != SQLITE_OK) {
    NSLog(@"sqlite開けませんでした！=> %s", sqlite3_errmsg(sqlax));
  }

  sqlite3_stmt* statement;
  NSString *query = @"SELECT * FROM user;";
  sqlite3_prepare_v2(sqlax, [query UTF8String], -1, &statement, nil);

  while (sqlite3_step(statement) == SQLITE_ROW) {
    char *ownerNameChars = (char *) sqlite3_column_text(statement, 0);
    NSLog(@"Found : %s", ownerNameChars);
  }
  sqlite3_finalize(statement);
  sqlite3_close(sqlax);

}


@end
