//
//  DetailViewController.m
//  Week6Judie
//
//  Created by Judie Taylor on 3/4/14.
//  Copyright (c) 2014 Judie Taylor. All rights reserved.
//

#import "DetailViewController.h"
#import "Location.h"
#import "MapViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize mAnnotation, mUrlLabel,mActivity;

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
    
    self.navigationItem.title=self.mAnnotation.title;
    self.mUrlLabel.text=self.mAnnotation.url;
    
    NSURL *url=[NSURL URLWithString:self.mAnnotation.url];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [self.mWebsite loadRequest:request];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"WebView Started Loading");
    self.mActivity.hidden=NO;
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"WebView Finished Loading");
    self.mActivity.hidden=YES;
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"Error with Loading Webpage");
    self.mActivity.hidden=YES;
    
}

@end
