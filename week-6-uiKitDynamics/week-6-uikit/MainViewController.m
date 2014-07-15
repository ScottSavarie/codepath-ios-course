//
//  MainViewController.m
//  week-6-uikit
//
//  Created by Scott Savarie on 7/15/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property(nonatomic,strong) UIGravityBehavior *gravityBehavior;
@property(nonatomic, strong) UIPushBehavior *pushBehavior;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;
@property(strong,nonatomic) UICollisionBehavior *collisionBehavior;

- (IBAction)onTap:(id)sender;

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
    
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

    self.gravityBehavior = [[UIGravityBehavior alloc] init];
    self.pushBehavior = [[UIPushBehavior alloc] init];
    self.collisionBehavior = [[UICollisionBehavior alloc] init];
    
    self.pushBehavior.pushDirection = CGVectorMake(0, -1);
    
    [self.animator addBehavior:self.gravityBehavior];
    [self.animator addBehavior:self.pushBehavior];
    [self.animator addBehavior:self.collisionBehavior];
    
    self.collisionBehavior.collisionDelegate = self;
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)onTimer{
    
    int x = arc4random_uniform(300);
    CGRect frame = CGRectMake(x, 10, 100, 100);
    UIView *square = [[UIView alloc] initWithFrame:frame];
    square.backgroundColor = [UIColor lightGrayColor];
    square.tag = 0;
    [self.view addSubview:square];
    
    [self.gravityBehavior addItem: square];
    
    [self.collisionBehavior addItem:square];
    
}




- (IBAction)onTap:(id)sender {

    CGPoint point = [self.tapGestureRecognizer locationInView:self.view];
    CGRect frame = CGRectMake(point.x, point.y, 10, 10);
    UIView *bullet = [[UIView alloc] initWithFrame:frame];
    bullet.tag = 1;
    bullet.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bullet];
    
    
    [self.pushBehavior addItem: bullet];

    [self.collisionBehavior addItem: bullet];

}


- (void)collisionBehavior:(UICollisionBehavior*)behavior beganContactForItem:(id <UIDynamicItem>)item1 withItem:(id <UIDynamicItem>)item2 atPoint:(CGPoint)p{
    
    UIView *viewOne = (UIView *) item1;
    UIView *viewTwo = (UIView *) item2;
    
    
    [viewOne removeFromSuperview];
    [viewTwo removeFromSuperview];

    if(viewOne.tag == 0){
        [self destroySpaceShip:viewOne];
    }
    
    else if (viewTwo.tag == 1){
        [self destroyBullet:viewTwo];
    }
    
    
}


-(void)destroySpaceShip: (UIView *)spaceship{
    [spaceship removeFromSuperview];
}


-(void)destroyBullet: (UIView *)bullet{
    [bullet removeFromSuperview];
}


@end
