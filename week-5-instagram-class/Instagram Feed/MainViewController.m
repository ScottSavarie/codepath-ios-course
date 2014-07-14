//
//  MainViewController.m
//  Instagram Feed
//
//  Created by Billy Roh on 7/10/14.
//  Copyright (c) 2014 Billy Roh. All rights reserved.
//

#import "MainViewController.h"
#import "PhotoTableViewCell.h"
#import "CommentTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
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
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    NSString *url = @"YOUR URL HERE";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@", object);
        self.dataArray = object[@"data"];
        [self.tableView reloadData];
    }];
    
    UINib *photoCellNib = [UINib nibWithNibName:@"PhotoTableViewCell" bundle:nil];
    [self.tableView registerNib:photoCellNib forCellReuseIdentifier:@"PhotoTableViewCell"];
    
    UINib *commentTableViewCell = [UINib nibWithNibName:@"CommentTableViewCell" bundle:nil];
    [self.tableView registerNib:commentTableViewCell forCellReuseIdentifier:@"CommentTableViewCell"];
    
    self.tableView.rowHeight = 324;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *commentArray = self.dataArray[section][@"comments"][@"data"];
    return commentArray.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Photo cell (since row == 0)
    if (indexPath.row == 0) {
        PhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PhotoTableViewCell" forIndexPath:indexPath];
        
        NSDictionary *photoDictionary = self.dataArray[indexPath.section];
        NSURL *imageURL = [[NSURL alloc] initWithString:photoDictionary[@"images"][@"standard_resolution"][@"url"]];
        [cell.photoView setImageWithURL:imageURL];
        
        return cell;
    // Comment cell (since row != 0)
    } else {
        NSArray *commentArray = self.dataArray[indexPath.section][@"comments"][@"data"];
        CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentTableViewCell" forIndexPath:indexPath];
        NSDictionary *commentDictionary = commentArray[indexPath.row - 1];
        cell.commentLabel.text = commentDictionary[@"text"];
        return cell;
    }
    
}

- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 320;
    } else {
        return 100;
    }
}

@end
