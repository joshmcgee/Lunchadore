//
//  RestaurantListViewController.h
//  DS Luch App
//
//  Created by Josh McGee on 1/4/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantListCell.h"

@protocol RestaurantListViewControllerDelegate;



@interface RestaurantListViewController : UIViewController

@property (weak, nonatomic) IBOutlet id<RestaurantListViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITableView *listTableView;
@property (strong, nonatomic) IBOutlet UIButton *sortByNameButton;
@property (strong, nonatomic) IBOutlet UIButton *sortByRatingButton;
@property (strong, nonatomic) IBOutlet UIButton *sortByTimeButton;
@property (strong, nonatomic) IBOutlet NSString *restaurantName;
@property (strong, nonatomic) NSString *jaControllerTitle;
@property (strong, nonatomic) NSString *jaControllerImage;
@property (strong, nonatomic) NSString *jaControllerIndexPath;
@property (strong, nonatomic) NSArray *restaurantList;
@property (strong, nonatomic) NSArray *imageList;
@property (strong, nonatomic) NSArray *ratingList;
@property (strong, nonatomic) NSNumber *jaControllerRating;

- (IBAction)sortByName:(id)sender;
- (IBAction)sortByRating:(id)sender;
- (IBAction)sortByTime:(id)sender;

@end



@protocol RestaurantListViewControllerDelegate <NSObject>

@optional
- (void)selectedARestaurant:(RestaurantListViewController *) viewController;

@end