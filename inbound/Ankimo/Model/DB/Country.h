#import "RLMObject.h"

@class Country;

@interface Country : RLMObject

@property int ID;
@property NSString *CountryID;
@property NSString *CountryName;
@property BOOL ValidFlg;
@property BOOL DelFlg;

@end
