#import "RLMObject.h"

@class User;

@interface User : RLMObject

@property int ID;
@property NSString *UserID;
@property NSString *UserName;
@property NSString *CountryID;
@property BOOL ValidFlg;
@property BOOL DelFlg;

@end
