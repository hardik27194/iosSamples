//
//  NetworkManager.m
//  Ankimo
//
//  Created by takeshi on 2015/08/03.
//  Copyright (c) 2015年 takeshi. All rights reserved.
//

#import "NetworkManager.h"
#import "User.h"
#import "AFNetworking.h"


@implementation NetworkManager

+ (instancetype)sharedManager
{
    static NetworkManager *instance;
    @synchronized(self) {
        if (!instance) {
            instance = [[NetworkManager alloc] init];
        }
    }
    return instance;
}


-(NSDictionary *)jsonParse {
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *dataPath = [bundle pathForResource:@"data1" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataPath];
    
    NSError *error;
    NSDictionary *temp = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSLog(@" %@ ", [temp description]);

    return temp;
}


-(void)temp1 {
    
    NSDictionary* dic = [self jsonParse];
    

    
    
    
    
    
//    id clazz = NSClassFromString(@"User");
//    id instance = [[clazz alloc] init];
//    
//    [instance setValue:@"111" forKey:@"UserID"];

    
    
//    var person = Person()
//    person.name = "person1"
//    person.Id = "1"
//    
//    var realm = RLMRealm.defaultRealm
//    
//    realm().beginWriteTransaction()
//    realm().addObject(person)
//    realm().commitWriteTransaction()

    
    
    
    //
//    NSLog(" dic keys %@ " , dic.allKeys )
//    
//    for (key , obj) in dic {
//        
//        let k = key as! String
//        NSLog(" %@", k)
//        
//        var clazz = NSClassFromString("User")
//        
//        
//        
//        
//        
//    }
    

    
}



-(void)networkConnection:(NSDictionary *)param {

    // afnetwork とか使うのか？
    //
    
    
//    https://script.google.com/macros/s/AKfycbyc7xbD7nWXjOTAiWmHkqn7nAJYJw0-ti8hxpjdCwIyYKZY4ZPI/exec
    
    //  https://script.googleusercontent.com/macros/echo?user_content_key=9yzWFL4-lZpmQOio0tEVQlhSkte36yNRbKWHyYOLuyq20hSOR8lhGm0F8jDK_YJ7jzHUHHshCW0yXemDDiwGmiKRhq9nDYLMm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnJeTZGTQleNmqFIjcVsa0Mhpg1YXNkWcH9qKCYhYEc6Urv9YucEP8NQHnrCj84yvO6ulvgGoPju3&lib=M1YuiIlUIYQhjgcF-1eOKmH8_hOr6PRpY
    

//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:@""
//      parameters:nil
//         success:^(AFHTTPRequestOperation *operation, id responseObject) {
//         }
//         failure:^(AFHTTPRequestOperation *operation, NSError *error){
//         }];
//    
//    
    

}


@end
