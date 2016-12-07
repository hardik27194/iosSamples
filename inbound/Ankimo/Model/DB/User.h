#import "RLMObject.h"

@class User;

@interface User : RLMObject

@property int ID;
@property int UserID;
@property string UserName;
@property int CountryID;
@property bool ValidFlg;
@property bool DelFlg;

@end
