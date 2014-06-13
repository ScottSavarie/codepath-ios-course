//
//  SplashViewController.m
//  thursday-june-12
//
//  Created by Scott Savarie on 6/12/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "SplashViewController.h"
#import "SearchViewController.h"



@interface SplashViewController ()

- (IBAction)onYesButton:(id)sender;





@end

@implementation SplashViewController

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

- (IBAction)onYesButton:(id)sender {

    UIViewController *vc = [[SearchViewController alloc] init];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc animated:YES completion:nil];
    

}




@end
