//
//  RestaurantDetailViewController.h
//  DS Luch App
//
//  Created by Josh McGee on 1/4/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "RestaurantTagCell.h"

@protocol RestaurantDetailViewControllerDelegate;



@interface RestaurantDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet id<RestaurantDetailViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UITableView *tagTableView;
@property (weak, nonatomic) IBOutlet UIImageView *restaurantImage;
@property (weak, nonatomic) IBOutlet UIImage *starImage;
@property (weak, nonatomic) IBOutlet UIImage *starImageOutline;

@property (weak, nonatomic) IBOutlet UIButton *chooseThisButton;
@property (weak, nonatomic) IBOutlet UIButton *oneStarButton;
@property (weak, nonatomic) IBOutlet UIButton *twoStarButton;
@property (weak, nonatomic) IBOutlet UIButton *threeStarButton;
@property (weak, nonatomic) IBOutlet UIButton *fourStarButton;
@property (weak, nonatomic) IBOutlet UIButton *fiveStarButton;
@property (strong, nonatomic) NSArray *emailArray;
@property (assign, nonatomic) NSNumber *rating;
@property (assign, nonatomic) NSString *resturantTitle;

- (IBAction)backButtonHit:(id)sender;
- (IBAction)chooseButtonHit:(id)sender;

- (IBAction)oneStarButtonHit:(id)sender;
- (IBAction)twoStarButtonHit:(id)sender;
- (IBAction)threeStarButtonHit:(id)sender;
- (IBAction)fourStarButtonHit:(id)sender;
- (IBAction)fiveStarButtonHit:(id)sender;

@end



@protocol RestaurantDetailViewControllerDelegate <NSObject>

@optional
- (void)hitBackButtonOnDetailViewController:(RestaurantDetailViewController *) viewController;

@end