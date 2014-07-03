//
//  TabViewController.m
//  Tumblr
//
//  Created by Scott Savarie on 7/2/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "TabViewController.h"
#import "DashboardViewController.h"
#import "SearchViewController.h"
#import "PostViewController.h"
#import "AccountViewController.h"
#import "ActivityViewController.h"

#define RADIANS(degrees) ((degrees * M_PI) / 180.0)


@interface TabViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (nonatomic, strong) UINavigationController *DashboardNavigationController;
@property (nonatomic, strong) UINavigationController *ActivityNavigationController;

@property (nonatomic, strong) DashboardViewController *DashboardViewController;
@property (nonatomic, strong) SearchViewController *SearchViewController;
@property (nonatomic, strong) PostViewController *PostViewController;
@property (nonatomic, strong) AccountViewController *AccountViewController;
@property (nonatomic, strong) ActivityViewController *ActivityViewController;

@property (weak, nonatomic) IBOutlet UIButton *dashButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *postButton;
@property (weak, nonatomic) IBOutlet UIButton *accountButton;
@property (weak, nonatomic) IBOutlet UIButton *activityButton;
@property (weak, nonatomic) IBOutlet UIButton *nevermindButton;

@property (weak, nonatomic) IBOutlet UIView *tooltipContainer;
@property (weak, nonatomic) IBOutlet UILabel *tooltipTextLabel;
@property (weak, nonatomic) IBOutlet UIView *postOverlay;
@property (weak, nonatomic) IBOutlet UIView *textPostContainer;



- (IBAction)onDashButton:(id)sender;
- (IBAction)onSearchButton:(id)sender;
- (IBAction)onPostButton:(id)sender;
- (IBAction)onAccountButton:(id)sender;
- (IBAction)onActivityButton:(id)sender;
- (IBAction)onNevermindButton:(id)sender;


@end

@implementation TabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        // Init View / Nav Controllers
        self.DashboardViewController = [[DashboardViewController alloc] init];
        self.SearchViewController = [[SearchViewController alloc] init];
        self.PostViewController = [[PostViewController alloc] init];
        self.AccountViewController = [[AccountViewController alloc] init];
        self.ActivityViewController = [[ActivityViewController alloc] init];
        
        self.DashboardNavigationController = [[UINavigationController alloc] initWithRootViewController:self.DashboardViewController];
        self.DashboardNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:(35/255.0) green:(49/255.0) blue:(70/255.0) alpha:1];

        self.ActivityNavigationController = [[UINavigationController alloc] initWithRootViewController:self.ActivityViewController];
        self.ActivityNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:(35/255.0) green:(49/255.0) blue:(70/255.0) alpha:1];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setNeedsStatusBarAppearanceUpdate];

    
    
    // Invoke Dashboard Button
    [self onDashButton:nil];
    self.dashButton.selected = YES;

    
    //Setup tool tip
    self.tooltipTextLabel.layer.cornerRadius = 3;
    [self performSelector:@selector(toolTipBounce) withObject:nil afterDelay:0.1f];
    
    
    // Overlay and Button setup
    
    self.postOverlay.alpha = (0);
    self.textPostContainer.alpha = (0);
    self.textPostContainer.center = CGPointMake(self.textPostContainer.center.x, 800);
    self.nevermindButton.center = CGPointMake(self.nevermindButton.center.x, 800);
    self.nevermindButton.alpha = (0);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)toolTipBounce{
    self.tooltipContainer.alpha = (1);
    [UIView animateWithDuration:0.8 delay:0 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatAutoreverses:YES];
        self.tooltipContainer.center = CGPointMake(self.tooltipContainer.center.x, 480);
    } completion:nil];

}

- (IBAction)onDashButton:(id)sender{
    self.dashButton.selected = YES;
    self.searchButton.selected = NO;
    self.postButton.selected = NO;
    self.accountButton.selected = NO;
    self.activityButton.selected = NO;
    self.DashboardNavigationController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.DashboardNavigationController.view];
    [self preferredStatusBarStyle];
    
    [self toolTipBounce];

    
}



- (IBAction)onSearchButton:(id)sender {
    self.dashButton.selected = NO;
    self.searchButton.selected = YES;
    self.postButton.selected = NO;
    self.accountButton.selected = NO;
    self.activityButton.selected = NO;
    self.SearchViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.SearchViewController.view];
    
    self.tooltipContainer.alpha = (0);

}



- (IBAction)onPostButton:(id)sender {
    self.dashButton.selected = NO;
    self.searchButton.selected = NO;
    self.postButton.selected = YES;
    self.accountButton.selected = NO;
    self.activityButton.selected = NO;
    [self toolTipBounce];
    
    
    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.postOverlay.alpha = (0.8);
        self.textPostContainer.center = CGPointMake(self.textPostContainer.center.x, 200);
        self.textPostContainer.alpha = (1);
        self.nevermindButton.center = CGPointMake(self.nevermindButton.center.x, 523);
        self.nevermindButton.alpha = (1);

    } completion:nil];


}



- (IBAction)onAccountButton:(id)sender {
    self.dashButton.selected = NO;
    self.searchButton.selected = NO;
    self.postButton.selected = NO;
    self.accountButton.selected = YES;
    self.activityButton.selected = NO;
    self.AccountViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.AccountViewController.view];

    [self toolTipBounce];

}



- (IBAction)onActivityButton:(id)sender {
    self.dashButton.selected = NO;
    self.searchButton.selected = NO;
    self.postButton.selected = NO;
    self.accountButton.selected = NO;
    self.activityButton.selected = YES;
    self.ActivityNavigationController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.ActivityNavigationController.view];

    [self toolTipBounce];


}

- (IBAction)onNevermindButton:(id)sender {
    
    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.postOverlay.alpha = (0);
        self.textPostContainer.center = CGPointMake(self.textPostContainer.center.x, 500);
        self.textPostContainer.alpha = (0);
        self.nevermindButton.center = CGPointMake(self.nevermindButton.center.x, 800);
        self.nevermindButton.alpha = (0);

    } completion:nil];
    
    
}



// 
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end
