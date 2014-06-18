//
//  loginViewController.m
//  facebook-login
//
//  Created by Scott Savarie on 6/18/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()

@property (weak, nonatomic) IBOutlet UIView *loginFieldContainer;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loginActivityIndicator;

@property (weak, nonatomic) IBOutlet UIButton *signUpText;

- (IBAction)onTapOutside:(id)sender;
- (IBAction)emailEditingBegin:(id)sender;
- (IBAction)passwordEditingBegin:(id)sender;
- (IBAction)loginButtonOnTap:(id)sender;


-(void)loginUpAnimation;
-(void)loginDownAnimation;




@end

@implementation loginViewController

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
    
    
    
    //get loginFieldContainer position
    

    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// Login Up animation
-(void)loginUpAnimation {
    [UIView animateWithDuration:0.2 animations:^{
        self.loginFieldContainer.frame = CGRectMake(
            self.loginFieldContainer.frame.origin.x,
            140,
            self.loginFieldContainer.frame.size.width,
            self.loginFieldContainer.frame.size.height
           );
        }];
    
    [UIView animateWithDuration:0.4 animations:^{
        self.loginButton.frame = CGRectMake(
        self.loginButton.frame.origin.x,
        253,
        self.loginButton.frame.size.width,
        self.loginButton.frame.size.height
       );
    }];
    
    [UIView animateWithDuration:0.6 animations:^{
        self.signUpText.frame = CGRectMake(
        self.signUpText.frame.origin.x,
        312,
        self.signUpText.frame.size.width,
        self.signUpText.frame.size.height
       );
    }];

}

// Login Down Animation
-(void)loginDownAnimation{
    [UIView animateWithDuration:0.2 animations:^{
        self.loginFieldContainer.frame = CGRectMake(
        self.loginFieldContainer.frame.origin.x,
        224,
        self.loginFieldContainer.frame.size.width,
        self.loginFieldContainer.frame.size.height
       );
    }];
    
    [UIView animateWithDuration:0.4 animations:^{
        self.loginButton.frame = CGRectMake(
        self.loginButton.frame.origin.x,
        333,
        self.loginButton.frame.size.width,
        self.loginButton.frame.size.height
       );
    }];
    
    [UIView animateWithDuration:0.6 animations:^{
        self.signUpText.frame = CGRectMake(
        self.signUpText.frame.origin.x,
        473,
        self.signUpText.frame.size.width,
        self.signUpText.frame.size.height
       );
    }];
}


- (IBAction)onTapOutside:(id)sender {
    [self.view endEditing:YES];
    [self loginDownAnimation];
}

- (IBAction)emailEditingBegin:(id)sender {
   [self loginUpAnimation];
}


- (IBAction)passwordEditingBegin:(id)sender {
   [self loginUpAnimation];
    
}




- (IBAction)loginButtonOnTap:(id)sender {
    [self loginDownAnimation];
    [self.view endEditing:YES];
    
}





@end
