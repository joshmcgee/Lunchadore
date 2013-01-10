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

- (IBAction)backButtonHit:(id)sender;
- (IBAction)chooseButtonHit:(id)sender;

@end



@protocol RestaurantDetailViewControllerDelegate <NSObject>

@optional
- (void)hitBackButtonOnDetailViewController:(RestaurantDetailViewController *) viewController;

@end