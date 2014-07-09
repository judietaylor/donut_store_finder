//
//  MapViewController.m
//  Week6Judie
//
//  Created by Judie Taylor on 3/4/14.
//  Copyright (c) 2014 Judie Taylor. All rights reserved.
//

#import "MapViewController.h"
#import "DetailViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mMap, mLocation;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.navigationItem.title=[NSString stringWithFormat:@"%@ Store",self.mLocation.name];
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
	// Do any additional setup after loading the view.
    
    CLLocationCoordinate2D point=CLLocationCoordinate2DMake(self.mLocation.lat,self.mLocation.lng);
    
    MyAnnotation *ann=[[MyAnnotation alloc]initWithCoordinate:point title:self.mLocation.name subtitle:[NSString stringWithFormat:@"%f,%f",self.mLocation.lat,self.mLocation.lng] url:[NSString stringWithFormat:@"http://en.wikipedia.org/wiki/%@",self.mLocation.name]];
    
    [self.mMap addAnnotation:ann];
    
    MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(point, 10000.0f, 10000.0f);
    [self.mMap setRegion:region animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MKMapViewDelegate methods

- (void)mapViewDidFinishLoadingMap: (MKMapView *)mapView{
    NSLog(@"Map Finished Loading.");
    
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
    NSString *reuseIdentifier=@"Pin";
    
    MKPinAnnotationView *pin=(MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"Pin"];
    if(pin==nil){
        pin=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    }
    
    pin.canShowCallout=YES;
    pin.rightCalloutAccessoryView=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    pin.animatesDrop=YES;
    pin.pinColor=MKPinAnnotationColorRed;
    return pin;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    MyAnnotation *annotation=(MyAnnotation*) view.annotation;
    NSLog(@"My Annotation Tapped:%@",annotation.title);
    self.mCurrentAnnotation=annotation;
    [self performSegueWithIdentifier:@"mappush" sender:self];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    DetailViewController *controller=(DetailViewController*) segue.destinationViewController;
    controller.mAnnotation=self.mCurrentAnnotation;
    
}

@end
