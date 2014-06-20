//
//  MainViewController.m
//  codepathWeek3
//
//  Created by Michael Wang on 6/19/14.
//  Copyright (c) 2014 mkwng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *feedScrollView;
@property (weak, nonatomic) IBOutlet UIView *megaphoneView;
@property (weak, nonatomic) IBOutlet UIView *feedInternalView;
- (IBAction)onMegaphone:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@property BOOL isLoading;
-(void)loadMoreStories;

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
    // Do any additional setup after loading the view from its nib.
    self.feedScrollView.contentSize = CGSizeMake(320, 1800);
    
    self.feedScrollView.delegate = self;
    self.isLoading = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onMegaphone:(id)sender {
    
    [UIView animateWithDuration:.3 animations:^{
        self.megaphoneView.alpha = 0;
        
    }];
    
    [UIView animateWithDuration:.3 animations:^{
        self.feedInternalView.frame = CGRectMake(self.feedInternalView.frame.origin.x, self.feedInternalView.frame.origin.y - self.megaphoneView.frame.size.height, self.feedInternalView.frame.size.width, self.feedInternalView.frame.size.height);
        self.feedScrollView.contentSize = CGSizeMake(320, 900-self.megaphoneView.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"contentOffset: %@", NSStringFromCGPoint(self.feedScrollView.contentOffset));
    NSLog(@"contentSize: %@", NSStringFromCGSize(self.feedScrollView.contentSize));
    
    if (self.feedScrollView.contentOffset.y + self.feedScrollView.frame.size.height >= self.feedScrollView.contentSize.height){
    
        [self loadMoreStories];
        
    }
    
    else {
        

    
    }

}


-(void)loadMoreStories {

    if (self.isLoading){
        return;
    }
    else {
    self.isLoading = YES;
    CGRect frame = self.feedInternalView.frame;
    frame.size.height += 500;
    self.feedScrollView.contentSize = CGSizeMake(320, self.feedInternalView.frame.size.height);
    self.isLoading = NO;
    
    }
}


@end
