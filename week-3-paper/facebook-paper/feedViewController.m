//
//  feedViewController.m
//  facebook-paper
//
//  Created by Scott Savarie on 6/25/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "feedViewController.h"

@interface feedViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *newsFeedScroll;
@property (weak, nonatomic) IBOutlet UIView *headlineView;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *headlinePanRecognizer;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *newsfeedPanRecognizer;

@property (strong, nonatomic) IBOutlet UIView *appView;


- (IBAction)onHeadlinePan:(id)sender;

- (IBAction)onNewsfeedPan:(id)sender;


@end

@implementation feedViewController

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

    // Set scroll view size
    self.newsFeedScroll.contentSize = CGSizeMake(1445, 266);
//    self.newsFeedScroll.delegate = self;
    
    self.newsfeedPanRecognizer.delegate = self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onHeadlinePan:(id)sender {
    // Get velocity
    CGPoint velocity = [self.headlinePanRecognizer velocityInView:self.view];
    
    if (self.headlinePanRecognizer.state == UIGestureRecognizerStateBegan) {
    }
    
    // if panning
    else if (self.headlinePanRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [self.headlinePanRecognizer translationInView:self.view];
        
        // if view is less than 0 and panning up add tension
        if (self.headlineView.frame.origin.y < 0  && velocity.y <0){
            CGPoint translation = [self.headlinePanRecognizer translationInView:self.view];
            self.headlineView.center = CGPointMake(self.headlineView.center.x,self.headlineView.center.y + translation.y / 6);
            [self.headlinePanRecognizer setTranslation:CGPointMake(0, 0) inView:self.view];
        }
        
        else {
            self.headlineView.center = CGPointMake(self.headlineView.center.x, self.headlineView.center.y + translation.y);
            [self.headlinePanRecognizer setTranslation:CGPointMake(0, 0) inView:self.view];
        }
    }
    

    // if panning has ended
    else if (self.headlinePanRecognizer.state == UIGestureRecognizerStateEnded) {
        
        // and view was going down
        if (velocity.y > 0){
            [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.headlineView.center = CGPointMake(self.headlineView.center.x, 760);
            } completion:nil];
        }
        
        // and view was going up
        else if (velocity.y < 0){
            [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.headlineView.center = CGPointMake(self.headlineView.center.x, self.appView.center.y);
            } completion:nil];
        }
    }

    
    
    
    
    
}

- (IBAction)onNewsfeedPan:(id)sender {
    CGPoint velocity = [self.newsfeedPanRecognizer velocityInView:self.view];
    
    if (self.headlinePanRecognizer.state == UIGestureRecognizerStateBegan) {
    }
    
    else if (self.headlinePanRecognizer.state == UIGestureRecognizerStateChanged) {
        NSLog(@"is panning");
        
        
        CGPoint translation = [self.newsfeedPanRecognizer translationInView:self.view];
        self.newsFeedScroll.frame = CGRectMake(0, self.newsFeedScroll.frame.origin.y + (translation.y /40), self.newsFeedScroll.frame.size.width, self.newsFeedScroll.frame.size.height);
        
        self.newsFeedScroll.transform = CGAffineTransformMakeScale(1 + -translation.y/80, 1+ -translation.y /80);
        [self.headlinePanRecognizer setTranslation:CGPointMake(0, 0) inView:self.view];
        
    }
    
    
    else if (self.headlinePanRecognizer.state == UIGestureRecognizerStateEnded) {
        
        if (velocity.y < 0){
            
            [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                  self.newsFeedScroll.frame = CGRectMake(0, 0, 320, 568);
//                self.newsFeedScroll.contentSize = CGSizeMake(3132, 568);
                  self.newsFeedScroll.transform = CGAffineTransformMakeScale(1.95, 1.95);



            } completion:nil];
            

        }
        
        
    }
    
    


}



- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}


@end
