//
//  newsFeedViewController.m
//  week-1-facebook-newsfeed
//
//  Created by Scott Savarie on 6/11/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "newsFeedViewController.h"
#import "TTTAttributedLabel.h"

@interface newsFeedViewController ()
@property (weak, nonatomic) IBOutlet UIView *storyContainer;
@property (weak, nonatomic) IBOutlet UIImageView *storyImgView;



@property (weak, nonatomic) IBOutlet UIView *commentBar;




- (IBAction)writeComment:(id)sender;


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
    self.storyContainer.layer.cornerRadius = 2;
    self.storyContainer.layer.shadowColor = [UIColor blackColor].CGColor;
    self.storyContainer.layer.shadowOffset = CGSizeMake(0, 1);
    self.storyContainer.layer.shadowOpacity = 0.1;
    self.storyContainer.layer.shadowRadius = 2;
    
    // Image Styling
    self.storyImgView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.storyImgView.layer.shadowOffset = CGSizeMake(0,1);
    self.storyImgView.layer.shadowOpacity= 0.5;
    self.storyImgView.layer.shadowRadius = 1;
    
    
    // Make title white
    UIColor *white = [UIColor whiteColor];
    NSMutableDictionary *navBarTextAttributes = [NSMutableDictionary dictionaryWithCapacity:1];
    [navBarTextAttributes setObject:white forKey:NSForegroundColorAttributeName ];
    self.navigationController.navigationBar.titleTextAttributes = navBarTextAttributes;
    

    // Comment Bar Styling
    self.commentBar.layer.shadowColor = [UIColor blackColor].CGColor;
    self.commentBar.layer.shadowOffset = CGSizeMake(0, -1);
    self.commentBar.layer.shadowOpacity = 0.1;
    self.commentBar.layer.shadowRadius = 1;
    
    
    // Set up Tap Gesture
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard)];
    
    [self.view addGestureRecognizer:tapGesture];
    
    
    
    
    // Create TTT Label inside other view and style link
    TTTAttributedLabel *storyLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(10, 0, 280, 200)];
    storyLabel.font = [UIFont systemFontOfSize:14];
    storyLabel.textColor = [UIColor darkGrayColor];
    storyLabel.numberOfLines = 0;
    storyLabel.enabledTextCheckingTypes = NSTextCheckingTypeLink;
    storyLabel.delegate = self;
    storyLabel.userInteractionEnabled=YES;
    storyLabel.text = @"From collarless shirts to high-waisted pants, #Her's costume designer, Casey Storm, explains how he created his fashion looks for the future: http://bit.ly/jV9zM8";
    
    [self.storyContainer addSubview:storyLabel];
    
    storyLabel.linkAttributes = @{
        NSForegroundColorAttributeName: [UIColor purpleColor],
        NSUnderlineStyleAttributeName: @(NSUnderlineStyleNone),
    };

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




// dismiss keyboard

-(void)hideKeyBoard {
    [self.view endEditing:YES];

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    self.commentBar.center = CGPointMake(160, 500);
    [UIView commitAnimations];
    
    
}


// Comment tap - move comment view

- (IBAction)writeComment:(id)sender {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    self.commentBar.center = CGPointMake(160, 330);
    [UIView commitAnimations];
    
}


    

    





@end
