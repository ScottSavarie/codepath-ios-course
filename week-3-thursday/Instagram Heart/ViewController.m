//
//  ViewController.m
//  Instagram Heart
//
//  Created by Billy Roh on 6/26/14.
//  Copyright (c) 2014 Billy Roh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *heartImageView;
- (IBAction)viewDoubleTap:(id)sender;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
@property (strong, nonatomic) IBOutlet UIView *appView;
@property (strong, nonatomic) UIView *duplicateView;
- (void)pinchMethod:(UIPinchGestureRecognizer *)pinchGestureRecognizer;

- (IBAction)onHeartPan:(id)sender;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *heartPanGesture;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *cashMoneyPan;
- (IBAction)onCashMoneyPan:(id)sender;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *megaphonePan;
- (IBAction)onMegaphonePan:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *cashMoneyView;
@property (weak, nonatomic) IBOutlet UIImageView *megaphoneView;

- (void)rotateMethod:(UIRotationGestureRecognizer *)rotateGestureRecognizer;
@end

@implementation ViewController

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
    
    
    [self.heartImageView addGestureRecognizer:self.heartPanGesture];
    self.heartImageView.userInteractionEnabled = YES;
    
    [self.cashMoneyView addGestureRecognizer:self.cashMoneyPan];
    self.cashMoneyView.userInteractionEnabled = YES;
    
    [self.megaphoneView addGestureRecognizer:self.megaphonePan];
    self.megaphoneView.userInteractionEnabled = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)viewDoubleTap:(id)sender {
    CGPoint point = [self.tapGesture locationInView: self.appView];
    CGRect frame = CGRectMake(point.x, point.y, 50, 50);
    
    UIImageView *heartView = [[UIImageView alloc] initWithFrame:frame];
    heartView.image = [UIImage imageNamed: @"Heart"];
    heartView.center = point;
    
    
    
    //Pinch Gesture
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchMethod:)];
//    [heartView addGestureRecognizer:pinchGestureRecognizer];
    
    
    // Rotate Gesture
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateMethod:)];
    [heartView addGestureRecognizer:rotationGestureRecognizer];
    
    
    [self.heartImageView addGestureRecognizer:self.heartPanGesture];
    
    heartView.userInteractionEnabled = YES;
    
    [self.appView addSubview:heartView];
    
    
}


// Pinch Method
- (void)pinchMethod:(UIPinchGestureRecognizer *)pinchGestureRecognizer {
    CGAffineTransform transform = CGAffineTransformMakeScale(pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
    pinchGestureRecognizer.view.transform = transform;
}

- (IBAction)onHeartPan:(id)sender {
    if (self.heartPanGesture.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [self.heartPanGesture locationInView:self.appView];
        CGRect frame = CGRectMake(point.x, point.y, 30, 30);
        UIImageView *heartView = [[UIImageView alloc] initWithFrame:frame];
        heartView.image = [UIImage imageNamed: @"Heart"];
        heartView.center = point;
        [self.appView addSubview:heartView];
        self.duplicateView = heartView;
    } else if (self.heartPanGesture.state == UIGestureRecognizerStateChanged) {
        self.duplicateView.center = [self.heartPanGesture locationInView:self.appView];
    } else if (self.heartPanGesture.state == UIGestureRecognizerStateEnded) {
    }
}

- (IBAction)onCashMoneyPan:(id)sender {
    if (self.cashMoneyPan.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [self.cashMoneyPan locationInView:self.appView];
        CGRect frame = CGRectMake(point.x, point.y, 30, 30);
        UIImageView *heartView = [[UIImageView alloc] initWithFrame:frame];
        heartView.image = [UIImage imageNamed: @"CashMoney"];
        heartView.center = point;
        [self.appView addSubview:heartView];
        self.duplicateView = heartView;
    } else if (self.cashMoneyPan.state == UIGestureRecognizerStateChanged) {
        self.duplicateView.center = [self.cashMoneyPan locationInView:self.appView];
    } else if (self.cashMoneyPan.state == UIGestureRecognizerStateEnded) {
    }
}

- (IBAction)onMegaphonePan:(id)sender {
    
    if (self.megaphonePan.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [self.megaphonePan locationInView:self.appView];
        CGRect frame = CGRectMake(point.x, point.y, 30, 30);
        UIImageView *heartView = [[UIImageView alloc] initWithFrame:frame];
        heartView.image = [UIImage imageNamed: @"Megaphone"];
        heartView.center = point;
        [self.appView addSubview:heartView];
        self.duplicateView = heartView;
    } else if (self.megaphonePan.state == UIGestureRecognizerStateChanged) {
        self.duplicateView.center = [self.megaphonePan locationInView:self.appView];
    } else if (self.megaphonePan.state == UIGestureRecognizerStateEnded) {
    }
}

- (void)rotateMethod:(UIRotationGestureRecognizer *)rotateGestureRecognizer  {
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(rotateGestureRecognizer.rotation);
    rotateGestureRecognizer.view.transform = transform;

}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return YES;
}

@end
