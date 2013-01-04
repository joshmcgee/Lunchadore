//
//  RestaurantListViewController.h
//  DS Luch App
//
//  Created by Josh McGee on 1/4/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantListCell.h"

@interface RestaurantListViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *listTableView;
@property (strong, nonatomic) IBOutlet UIButton *sortByNameButton;
@property (strong, nonatomic) IBOutlet UIButton *sortByRatingButton;
@property (strong, nonatomic) IBOutlet UIButton *sortByTimeButton;

- (IBAction)sortByName:(id)sender;
- (IBAction)sortByRating:(id)sender;
- (IBAction)sortByTime:(id)sender;

@end
