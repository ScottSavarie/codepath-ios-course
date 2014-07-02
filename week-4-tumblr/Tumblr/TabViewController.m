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
@property (nonatomic, strong) DashboardViewController *DashboardViewController;
@property (nonatomic, strong) SearchViewController *SearchViewController;
@property (nonatomic, strong) PostViewController *PostViewController;
@property (nonatomic, strong) AccountViewController *AccountViewController;
@property (nonatomic, strong) ActivityViewController *ActivityViewController;


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
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    // Invoke Dash Button
    [self onDashButton:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)onDashButton:(id)sender {
    self.DashboardViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.DashboardViewController.view];
    
}



- (IBAction)onSearchButton:(id)sender {
    self.SearchViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.SearchViewController.view];


}



- (IBAction)onPostButton:(id)sender {
    self.PostViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.PostViewController.view];

}



- (IBAction)onAccountButton:(id)sender {
    self.AccountViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.AccountViewController.view];

}



- (IBAction)onActivityButton:(id)sender {
    self.ActivityViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.ActivityViewController.view];

}
@end
