//
//  MainViewController.m
//  thursday-june-12
//
//  Created by Scott Savarie on 6/12/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    
    // New view
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(100,400, 200, 150)];
    greenView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:greenView];
    
    UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(10, 10, 200, 30)];
    label.text = @"Hello";
    [greenView addSubview:label];
    
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
