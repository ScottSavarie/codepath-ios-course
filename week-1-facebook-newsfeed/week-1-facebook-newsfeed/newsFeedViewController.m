//
//  newsFeedViewController.m
//  week-1-facebook-newsfeed
//
//  Created by Scott Savarie on 6/11/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "newsFeedViewController.h"

@interface newsFeedViewController ()
@property (weak, nonatomic) IBOutlet UIView *storyContainer;

@end

@implementation newsFeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Post";
        


        
       
        
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    // Card Syling
    self.storyContainer.layer.cornerRadius = 4;
    
    // Make title white
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
