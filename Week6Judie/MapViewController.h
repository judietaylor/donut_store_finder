//
//  MapViewController.h
//  Week6Judie
//
//  Created by Judie Taylor on 3/4/14.
//  Copyright (c) 2014 Judie Taylor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MyAnnotation.h"

@interface MapViewController : UIViewController<MKMapViewDelegate>

@property Location *mLocation;
@property (weak, nonatomic) IBOutlet MKMapView *mMap;
@property MyAnnotation *mCurrentAnnotation;

@end
