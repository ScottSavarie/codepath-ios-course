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




- (IBAction)onDashButton:(id)sender;
- (IBAction)onSearchButton:(id)sender;
- (IBAction)onPostButton:(id)sender;
- (IBAction)onAccountButton:(id)sender;
- (IBAction)onActivityButton:(id)sender;


@end

@implementation TabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        // Init View Controllers
        self.DashboardViewController = [[DashboardViewController alloc] init];
        self.SearchViewController = [[SearchViewController alloc] init];
        self.PostViewController = [[PostViewController alloc] init];
        self.AccountViewController = [[AccountViewController alloc] init];
        self.ActivityViewController = [[ActivityViewController alloc] init];
        
        self.DashboardNavigationController = [[UINavigationController alloc] initWithRootViewController:self.DashboardViewController];
        self.ActivityNavigationController = [[UINavigationController alloc] initWithRootViewController:self.ActivityViewController];

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setNeedsStatusBarAppearanceUpdate];

    
    
    // Invoke Dash Button
    [self onDashButton:nil];
    self.dashButton.selected = YES;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
}



- (IBAction)onSearchButton:(id)sender {
    self.dashButton.selected = NO;
    self.searchButton.selected = YES;
    self.postButton.selected = NO;
    self.accountButton.selected = NO;
    self.activityButton.selected = NO;
    self.SearchViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.SearchViewController.view];


}



- (IBAction)onPostButton:(id)sender {
    self.dashButton.selected = NO;
    self.searchButton.selected = NO;
    self.postButton.selected = YES;
    self.accountButton.selected = NO;
    self.activityButton.selected = NO;
    self.PostViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.PostViewController.view];

}



- (IBAction)onAccountButton:(id)sender {
    self.dashButton.selected = NO;
    self.searchButton.selected = NO;
    self.postButton.selected = NO;
    self.accountButton.selected = YES;
    self.activityButton.selected = NO;
    self.AccountViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.AccountViewController.view];

}



- (IBAction)onActivityButton:(id)sender {
    self.dashButton.selected = NO;
    self.searchButton.selected = NO;
    self.postButton.selected = NO;
    self.accountButton.selected = NO;
    self.activityButton.selected = YES;
    self.ActivityNavigationController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.ActivityNavigationController.view];
}



// 
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end
