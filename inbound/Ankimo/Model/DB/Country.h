#import "RLMObject.h"

@class Country;

@interface Country : RLMObject

@property int ID;
@property string CountryID;
@property string CountryName;
@property bool ValidFlg;
@property bool DelFlg;

@end
