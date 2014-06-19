//
//  loginViewController.m
//  facebook-login
//
//  Created by Scott Savarie on 6/18/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "loginViewController.h"
#import "newsFeedViewController.h"

@interface loginViewController ()

@property (weak, nonatomic) IBOutlet UIView *loginFieldContainer;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loginActivityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *signUpText;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;


- (IBAction)onTapOutside:(id)sender;
- (IBAction)emailEditingBegin:(id)sender;
- (IBAction)loginButtonOnTap:(id)sender;
- (IBAction)passwordEditingBegin:(id)sender;
- (IBAction)emailEditingChanged:(id)sender;
- (IBAction)passwordEditingChanged:(id)sender;


-(void)loginUpAnimation;
-(void)loginDownAnimation;
-(void)textInFieldsCheck;
-(void)passwordCheck;


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
    
    
    
    //disable btn
    self.loginButton.enabled = NO;

    

    

    
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
        self.loginButton.frame.size.height);
        self.loginActivityIndicator.frame = CGRectMake(274, 268, self.loginActivityIndicator.frame.size.width, self.loginActivityIndicator.frame.size.height);
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
        self.loginButton.frame.size.height);
        self.loginActivityIndicator.frame = CGRectMake(274, 348, self.loginActivityIndicator.frame.size.width, self.loginActivityIndicator.frame.size.height);

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



// Tap outside
- (IBAction)onTapOutside:(id)sender {
    [self.view endEditing:YES];
    [self loginDownAnimation];
}



// Email Activities
- (IBAction)emailEditingBegin:(id)sender {
    [self loginUpAnimation];

}

- (IBAction)emailEditingChanged:(id)sender {
    [self textInFieldsCheck];
}


// Password Activities
- (IBAction)passwordEditingBegin:(id)sender {
    [self loginUpAnimation];
}


- (IBAction)passwordEditingChanged:(id)sender {
    [self textInFieldsCheck];
}



// Text in Fields Check
-(void)textInFieldsCheck{

    if (self.emailTextField.text.length > 0 && self.passwordTextField.text.length > 0) {
        self.loginButton.enabled = YES;
    }
    
    else {
       self.loginButton.enabled = NO;
    }

}

// Password Check
-(void)passwordCheck {
    if (![self.passwordTextField.text  isEqualToString: @"password"]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Incorrect Password Brah"
        message: @"Yo dog, you used the wrong password :("
        delegate: self
        cancelButtonTitle:@"Ok"
        otherButtonTitles: nil];
        [alert show];
        [self.loginActivityIndicator stopAnimating];
        self.loginButton.enabled = YES;
        self.passwordTextField.text = nil;
        [self.loginButton setTitle:@"Log In" forState:UIControlStateNormal];
        
    }
    
    else {
        
        UIViewController *vc = [[newsFeedViewController alloc] init];
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:vc animated:YES completion:nil];
        

         }
    
}


// Login Button
- (IBAction)loginButtonOnTap:(id)sender {
    [self loginDownAnimation];
    [self.view endEditing:YES];
    [self.loginButton setTitle:@"Loggin In" forState:UIControlStateNormal];
    [self performSelector:@selector(passwordCheck) withObject:nil afterDelay:2];
    [self.loginActivityIndicator startAnimating];
    self.loginButton.enabled = YES;
}






@end
