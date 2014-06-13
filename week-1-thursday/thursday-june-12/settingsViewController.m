//
//  settingsViewController.m
//  thursday-june-12
//
//  Created by Scott Savarie on 6/12/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "settingsViewController.h"
#import "SearchViewController.h"

@interface settingsViewController ()


- (IBAction)onDoneUp:(id)sender;

@end

@implementation settingsViewController

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
    
    
    
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneUp:)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDoneUp:(id)sender {
    

    
    
   [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
@end
