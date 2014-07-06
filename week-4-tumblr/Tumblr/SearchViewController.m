//
//  SearchViewController.m
//  Tumblr
//
//  Created by Scott Savarie on 7/2/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *searchScrollView;
@property (weak, nonatomic) IBOutlet UIView *loadingOne;
@property (weak, nonatomic) IBOutlet UIView *loadingTwo;
@property (weak, nonatomic) IBOutlet UIView *loadingThree;

@end

@implementation SearchViewController

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
    // Do any additional setup after loading the view from its nib.

    self.searchScrollView.contentSize = CGSizeMake(320, 1217+100);
    
    [self setNeedsStatusBarAppearanceUpdate];

    // hide Search Scroll
    self.searchScrollView.alpha = (0);
    [self searchScrollAnimation];
    
    
    //hide loading images
    self.loadingOne.alpha = (0);
    self.loadingTwo.alpha = (0);
    self.loadingThree.alpha = (0);
    
    //loading animation
    [self loadingAnimation];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Show Scrollview after 3 seconds
-(void)searchScrollAnimation{
    [UIView animateWithDuration:0.3 delay:3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.searchScrollView.alpha = 1;
    } completion:nil];
}



// Loading animation

-(void)loadingAnimation{
    
        [UIView animateWithDuration:0.5 delay:0.25 options: UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionCurveEaseInOut animations:^{
            self.loadingOne.alpha = (1);
        } completion:nil];
    
        [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionCurveEaseInOut animations:^{
            self.loadingTwo.alpha = (1);
        } completion:nil];

        [UIView animateWithDuration:0.5 delay:0.75 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionCurveEaseInOut animations:^{
            self.loadingThree.alpha = (1);
        } completion:nil];

}







-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
