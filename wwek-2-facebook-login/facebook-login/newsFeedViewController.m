//
//  newsFeedViewController.m
//  facebook-login
//
//  Created by Scott Savarie on 6/18/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "newsFeedViewController.h"
#import "loginViewController.h"

@interface newsFeedViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *newsFeedScroll;
@property (weak, nonatomic) IBOutlet UIImageView *scrollViewFeedImg;


-(void)newsFeedAnimation;


@end

@implementation newsFeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"News Feed";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set height of Newsfeed scroll
    self.newsFeedScroll.contentSize = CGSizeMake(320, 1614);
    self.newsFeedScroll.delegate = self;
    self.newsFeedScroll.alpha = 0;
    
    // Hide News Feed
    self.newsFeedScroll.alpha = 0;
    
    // Show Login View Controller
    UIViewController *vc = [[loginViewController alloc] init];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didDismissSecondViewController) name:@"SecondViewControllerDismissed" object:nil];
    [self presentViewController:vc animated:NO completion:nil];

    
    // Title of News
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




// Show News Feed after 2 seconds

-(void)newsFeedAnimation{
    [UIView animateWithDuration:.3 animations:^{
        self.newsFeedScroll.alpha = 1;
    }];
}


// Present Feed After Login Modal is Dimissed
-(void)didDismissSecondViewController {
    [self performSelector:@selector(newsFeedAnimation) withObject:nil afterDelay:3];
}



@end
