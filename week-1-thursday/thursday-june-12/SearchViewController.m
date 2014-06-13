//
//  SearchViewController.m
//  thursday-june-12
//
//  Created by Scott Savarie on 6/12/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "SearchViewController.h"
#import "settingsViewController.h"
#import "resulstViewController.h"



@interface SearchViewController ()

- (IBAction)onSettingsUp:(id)sender;

- (IBAction)onSearchButton:(id)sender;


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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSettingsUp:(id)sender {
    
    
    UIViewController *vc = [[settingsViewController alloc] init];
    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    
    [self presentViewController:vc animated:YES completion:nil];
    
    
    
    
}

- (IBAction)onSearchButton:(id)sender {

    
    UIViewController *vc = [[resulstViewController alloc] init];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    

    
    
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:navigationController animated:YES completion:nil];
    
    
}




@end
