//
//  DetailViewController.h
//  Week6Judie
//
//  Created by Judie Taylor on 3/4/14.
//  Copyright (c) 2014 Judie Taylor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyAnnotation.h"

@interface DetailViewController : UIViewController<UIWebViewDelegate>

@property MyAnnotation *mAnnotation;
@property (weak, nonatomic) IBOutlet UIWebView *mWebsite;
@property (weak, nonatomic) IBOutlet UILabel *mUrlLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *mActivity;

@end
