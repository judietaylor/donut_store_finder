//
//  Location.m
//  Week2Solution
//
//  Created by Kiichi Takeuchi on 1/29/13.
//  Copyright (c) 2013 ObjectGraph LLC. All rights reserved.
//

#import "Location.h"


@implementation Location
@synthesize name;
@synthesize lat;
@synthesize lng;

-(NSString*) description{
    return [NSString stringWithFormat:@"%@(%f,%f)",
            self.name,self.lat,self.lng];
}

-(id) initWithName:(NSString*)nm lat:(float)la lng:(float)ln{
    self=[super init];
    if(self!=nil){
        self.name=nm;
        self.lat=la;
        self.lng=ln;
    }
    return self;
    
}

-(double) distanceTo:(Location*)other{
    double radius = 6378137.0; // Earth's radius in Meters
    double dLat = [self degreesToRadians:(self.lat - other.lat)];
    double dLon = [self degreesToRadians:(self.lng - other.lng)];
    double rLat1 =  [self degreesToRadians:self.lat];
    double rLat2 =  [self degreesToRadians:other.lat];
    double nA = pow ( sin(dLat/2.0), 2.0 ) + cos(rLat1) * cos(rLat2) * pow ( sin(dLon/2.0), 2.0 );
    double nC = 2.0 * atan2( sqrt(nA), sqrt( 1.0 - nA ));
    double nD = radius * nC;
    return nD; // Return our calculated distance
}

//Helper Function
-(double) degreesToRadians:(double) degrees {
    return degrees * M_PI / 180.0;
}

@end

