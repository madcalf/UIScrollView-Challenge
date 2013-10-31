//
//  DDDViewController.m
//  UIScrollView Challenge
//
//  Created by DDD on 2013-10-31.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import "DDDViewController.h"

@interface DDDViewController ()

@end

@implementation DDDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // create the imageView with an image
    UIImage *img = [UIImage imageNamed:@"bigWorldMap.jpg"];
    self.imageView = [[UIImageView alloc] initWithImage:img];
    
    // set up the scrolling parameters
    self.scrollView.contentSize = self.imageView.frame.size;
    self.scrollView.maximumZoomScale = 3.0;
    self.scrollView.minimumZoomScale = 0.3;
    [self.scrollView setContentOffset:CGPointMake(1000, 100.0) animated:YES];
    
    // add the imageView to the scrollView
    [self.scrollView addSubview:self.imageView];
    
    // assign this class as the delegate of the scrollView
    self.scrollView.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// UIScrollViewDelegate methods
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    // return the view object we want to zoom
    return self.imageView;
}

-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    
    // just feedback on the results of the zoom
    NSLog(@"The image was zoomed to a scale of: %f", scale );
}

-(BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    return YES;
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    // prevent the pan from decelerating, resulting in an instant stop
    // the targetContentOffset passed, is the expected contentOffset when the deceleration is finished. So by setting that point manually to the point when the user stopped dragging, should eliminate further decel to that original expepcted offset.
    
    // not clear on why the pointer syntax is needed here tho. Got this from stackoverflow, btw...
    *targetContentOffset = scrollView.contentOffset;
}

@end
