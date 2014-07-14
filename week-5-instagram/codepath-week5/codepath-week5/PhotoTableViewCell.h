//
//  PhotoTableViewCell.h
//  codepath-week5
//
//  Created by Scott Savarie on 7/10/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *tableViewPhoto;
@property (weak, nonatomic) IBOutlet UILabel *comments;

@end
