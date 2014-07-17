//
//  MainViewController.m
//  Flappy Bird
//
//  Created by Scott Savarie on 7/17/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *birdView;
@property (nonatomic, strong) UIDynamicAnimator *animator;

@property (nonatomic, strong) UIGravityBehavior *gravity;

@property (nonatomic, strong) UICollisionBehavior *collision;

@property(nonatomic, strong) UIDynamicItemBehavior *birdBehavior;

@property(nonatomic, strong) UIPushBehavior *push;

@property(nonatomic, strong) UIDynamicItemBehavior *pipeBehavior;



- (IBAction)onDown:(id)sender;








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
    
    
    // animation setup
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.gravity = [[UIGravityBehavior alloc] init];
    self.collision = [[UICollisionBehavior alloc] init];
    self.birdBehavior = [[UIDynamicItemBehavior alloc] init];
    self.push = [[UIPushBehavior alloc] initWithItems:nil mode:UIPushBehaviorModeInstantaneous];
    self.push.pushDirection = CGVectorMake(0, -0.5);
    
    self.pipeBehavior = [[UIDynamicItemBehavior alloc] init];
    self.pipeBehavior.resistance = 0;
    
    [self.animator addBehavior:self.gravity];
    [self.animator addBehavior:self.collision];
    [self.animator addBehavior:self.birdBehavior];
    [self.animator addBehavior:self.push];
    [self.animator addBehavior:self.pipeBehavior];
    
    self.collision.translatesReferenceBoundsIntoBoundary = NO;
    
    [self.gravity addItem:self.birdView];
    [self.collision addItem:self.birdView];
    [self.birdBehavior addItem:self.birdView];
    [self.push addItem:self.birdView];
    
    self.birdBehavior.elasticity = 0.4;
    
   
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(addPipes) userInfo:nil repeats:YES];
    [timer fire];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onDown:(UIGestureRecognizer *)longPressGestureRecognizer{
    
    if(longPressGestureRecognizer.state == UIGestureRecognizerStateBegan){
        float velocity = [self.birdBehavior linearVelocityForItem:self.birdView].y;
        [self.birdBehavior addLinearVelocity:CGPointMake(0, -velocity) forItem:self.birdView];
        self.push.active = YES;
    }

}



-(void)addPipes{
    
    float yPos = arc4random_uniform(200)-40;
    
    // Pipe from the top of the screen
    UIImage *pipeDownImage = [UIImage imageNamed:@"pipeDown"];
    UIImageView *pipeDownView = [[UIImageView alloc] initWithImage:pipeDownImage];
    pipeDownView.frame = CGRectMake(400, yPos, pipeDownImage.size.width, pipeDownImage.size.height);
    [self.view addSubview:pipeDownView];
    [self.pipeBehavior addItem:pipeDownView];
    [self.pipeBehavior addLinearVelocity:CGPointMake(-50, 0) forItem:pipeDownView];
    [self.collision addItem:pipeDownView];

    
    
    // Pipe from the bottom of the screen
    UIImage *pipeUpImage = [UIImage imageNamed:@"pipeUp"];
    UIImageView *pipeUpView = [[UIImageView alloc] initWithImage: pipeUpImage];
    pipeUpView.frame = CGRectMake(400, 768 - pipeUpImage.size.height + yPos, pipeUpImage.size.width, pipeUpImage.size.height);
    [self.view addSubview:pipeUpView];
    [self.pipeBehavior addItem:pipeUpView];
    [self.pipeBehavior addLinearVelocity:CGPointMake(-50, 0) forItem:pipeUpView];
    [self.collision addItem:pipeUpView];
}
@end
