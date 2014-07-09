

#import <Foundation/Foundation.h>

@interface Location : NSObject
@property NSString *name;
@property float lat;
@property float lng;
-(id) initWithName:(NSString*)nm lat:(float)la lng:(float)ln;
-(double) distanceTo:(Location*)other;
@end
