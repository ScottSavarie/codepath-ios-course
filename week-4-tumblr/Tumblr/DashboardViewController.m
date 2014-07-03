//
//  DashboardViewController.m
//  Tumblr
//
//  Created by Scott Savarie on 7/2/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "DashboardViewController.h"

@interface DashboardViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *dashboardScrollView;
@property (weak, nonatomic) IBOutlet UIView *loginViewContainer;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

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

    
    // Set up Login Form
    self.loginViewContainer.layer.cornerRadius = 2;
    self.loginViewContainer.center = CGPointMake(self.loginViewContainer.center.x, 300);
    self.loginViewContainer.alpha = (0);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void) onLoginButton{
    
    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.loginViewContainer.center = CGPointMake(self.loginViewContainer.center.x, 200);
        self.loginViewContainer.alpha = (1);
        self.dashboardScrollView.alpha = (0.1);
        self.navigationController.navigationBar.alpha = (0.1);
    } completion:nil];
    
    [self.emailTextField becomeFirstResponder];
    

}

- (IBAction)onCancelButton:(id)sender {
    
    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.loginViewContainer.center = CGPointMake(self.loginViewContainer.center.x, 300);
        self.loginViewContainer.alpha = (0);
        self.dashboardScrollView.alpha = (1);
        self.navigationController.navigationBar.alpha = (1);
    } completion:nil];
    
    [self.view endEditing:YES];
    
    
}




@end
