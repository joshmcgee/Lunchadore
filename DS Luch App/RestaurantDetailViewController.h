//
//  RestaurantDetailViewController.h
//  DS Luch App
//
//  Created by Josh McGee on 1/4/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RestaurantDetailViewControllerDelegate;

@interface RestaurantDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet id<RestaurantDetailViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButton;

- (IBAction)backButtonHit:(id)sender;

@end

@protocol RestaurantDetailViewControllerDelegate <NSObject>

@optional
- (void)hitBackButtonOnDetailViewController:(RestaurantDetailViewController *) viewController;

@end