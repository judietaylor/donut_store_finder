//
//  MyAnnotation.h
//  Week6Judie
//
//  Created by Judie Taylor on 3/4/14.
//  Copyright (c) 2014 Judie Taylor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MyAnnotation : NSObject<MKAnnotation>

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic,copy) NSString *url;
@property (nonatomic) CLLocationCoordinate2D coordinate;
-(id) initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString*) t subtitle:(NSString*) s url:(NSString*) u;

@end
