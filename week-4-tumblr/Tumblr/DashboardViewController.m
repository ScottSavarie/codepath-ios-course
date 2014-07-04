//
//  DashboardViewController.m
//  Tumblr
//
//  Created by Scott Savarie on 7/2/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "DashboardViewController.h"

#define RADIANS(degrees) ((degrees * M_PI) / 180.0)

@interface DashboardViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *dashboardScrollView;
@property (weak, nonatomic) IBOutlet UIView *loginViewContainer;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UIView *overlay;
@property (weak, nonatomic) IBOutlet UIImageView *homeLines;

- (IBAction)onCancelButton:(id)sender;
@end

@implementation DashboardViewController

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
    
    // Setup Navigation
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tumblr"]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log in" style:UIBarButtonItemStylePlain target:self action:@selector(onLoginButton)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self setNeedsStatusBarAppearanceUpdate];


    // Setup Overlay
    self.overlay.alpha = (0);
    [self.navigationController.view addSubview:self.overlay];
    
    
    // Setup Login Form
    self.loginViewContainer.layer.cornerRadius = 2;
    self.loginViewContainer.center = CGPointMake(self.loginViewContainer.center.x, 300);
    self.loginViewContainer.alpha = (0);
}

-(void)viewDidAppear:(BOOL)animated{
    [self runSpinAnimationOnView:self.homeLines duration:3 rotations:0.1 repeat:10000];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}



// Rotation Animation
- (void) runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat;
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}





- (void) onLoginButton{
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.overlay.alpha = (0.95);
    } completion:nil];
    
    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.loginViewContainer.center = CGPointMake(self.loginViewContainer.center.x, 200);
    } completion:nil];
    
    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.loginViewContainer.alpha = (1);
    } completion:nil];
    
    
    
    
    [self.emailTextField becomeFirstResponder];
}

- (IBAction)onCancelButton:(id)sender {
    
    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.loginViewContainer.center = CGPointMake(self.loginViewContainer.center.x, 300);
        self.loginViewContainer.alpha = (0);
        self.overlay.alpha = (0);
    } completion:nil];
    [self.navigationController.view endEditing:YES];
    
    
}




@end
