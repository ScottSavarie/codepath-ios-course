//
//  profileViewController.m
//  facebook-login
//
//  Created by Scott Savarie on 6/21/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "profileViewController.h"

@interface profileViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *profileScroll;

@end

@implementation profileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Aaron's Profile";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
    // Set height of Newsfeed scroll
    self.profileScroll.contentSize = CGSizeMake(320, 680);
    self.profileScroll.delegate = self;

    
    // Add title
    UIColor *white = [UIColor whiteColor];
    NSMutableDictionary *navBarTextAttributes = [NSMutableDictionary dictionaryWithCapacity:1];
    [navBarTextAttributes setObject:white forKey:NSForegroundColorAttributeName ];
    self.navigationController.navigationBar.titleTextAttributes = navBarTextAttributes;
    
    



}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
