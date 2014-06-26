//
//  feedViewController.m
//  facebook-paper
//
//  Created by Scott Savarie on 6/25/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "feedViewController.h"

@interface feedViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *newsFeedScroll;

@end

@implementation feedViewController

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

    // Set scroll view size
    self.newsFeedScroll.contentSize = CGSizeMake(1445, 266);
    self.newsFeedScroll.delegate = self;





}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
