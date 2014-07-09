//
//  MyAnnotation.m
//  Week6Judie
//
//  Created by Judie Taylor on 3/4/14.
//  Copyright (c) 2014 Judie Taylor. All rights reserved.
//

#import "MyAnnotation.h"
#import "Location.h"

@implementation MyAnnotation
@synthesize title,subtitle,coordinate,url;

-(id) initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString*) t subtitle:(NSString*) s url:(NSString*) u{
    self=[super init];
    if(self){
        self.title=t;
        self.subtitle=s;
        self.coordinate=c;
        self.url=u;
    }
    return self;
}

@end
