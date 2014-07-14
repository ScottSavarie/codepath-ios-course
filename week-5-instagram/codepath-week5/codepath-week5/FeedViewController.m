//
//  FeedViewController.m
//  codepath-week5
//
//  Created by Scott Savarie on 7/10/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "FeedViewController.h"
#import "PhotoTableViewCell.h"
#import "UIImageView+AFNetworking.h"


@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UITableView *feedTableView;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation FeedViewController

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
    NSString *url = @"https://api.instagram.com/v1/media/popular?access_token=10774503.f59def8.4566c0e99ac544c89f08392107fbbcc0";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@", object);
        self.dataArray = object[@"data"];
        [self.feedTableView reloadData];
    
    }];
    
    self.feedTableView.dataSource = self;
    self.feedTableView.delegate = self;

    
    UINib *photoCellNib = [UINib nibWithNibName:@"PhotoTableViewCell" bundle:nil];
    [self.feedTableView registerNib:photoCellNib forCellReuseIdentifier:@"photoCell"];
    self.feedTableView.rowHeight = 446;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    
    PhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"photoCell" forIndexPath:indexPath];
    NSDictionary *photoDictionary = self.dataArray[indexPath.row];
    NSURL *imageURL = [[NSURL alloc] initWithString:photoDictionary[@"images"] [@"standard_resolution"][@"url"]];
    [cell.tableViewPhoto setImageWithURL: imageURL];
    
    
    return cell;

}


//- (int) numberOfSectionsInTableView:(UITableView)







@end
