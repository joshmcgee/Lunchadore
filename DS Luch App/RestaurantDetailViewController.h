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

@protocol RestaurantDetailViewControllerDelegate;



@interface RestaurantDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet id<RestaurantDetailViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (strong, nonatomic) IBOutlet UIButton *chooseThisButton;
@property (strong, nonatomic) IBOutlet UIImageView *restaurantImage;
@property (strong, nonatomic) IBOutlet UIImage *starImage;
@property (strong, nonatomic) IBOutlet UIImage *starImageOutline;
@property (strong, nonatomic) IBOutlet UINavigationItem *navBar;

@property (strong, nonatomic) IBOutlet UIButton *oneStarButton;
@property (strong, nonatomic) IBOutlet UIButton *twoStarButton;
@property (strong, nonatomic) IBOutlet UIButton *threeStarButton;
@property (strong, nonatomic) IBOutlet UIButton *fourStarButton;
@property (strong, nonatomic) IBOutlet UIButton *fiveStarButton;
@property (strong, nonatomic) IBOutlet NSArray *emailArray;

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