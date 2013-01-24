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
@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property (weak, nonatomic) IBOutlet UIButton *sortByNameButton;
@property (weak, nonatomic) IBOutlet UIButton *sortByRatingButton;
@property (weak, nonatomic) IBOutlet UIButton *sortByTimeButton;
@property (assign, nonatomic) NSString *restaurantName;
@property (strong, nonatomic) NSArray *restaurantList;
@property (strong, nonatomic) NSArray *imageList;
@property (strong, nonatomic) NSArray *ratingList;

- (IBAction)sortByName:(id)sender;
- (IBAction)sortByRating:(id)sender;
- (IBAction)sortByTime:(id)sender;

@end



@protocol RestaurantListViewControllerDelegate <NSObject>

@optional
- (void)selectedARestaurant:(RestaurantListViewController *) viewController restaurantName:(NSString *)name rating:(NSNumber *) rating imageString:(NSString *) imageString indexPathString:(NSString *)indexPathString;

@end