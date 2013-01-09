//
//  RandomRestaurauntListViewController.h
//  DS Luch App
//
//  Created by Gary Johnston on 1/9/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantListViewController.h"

@protocol RandomRestaurauntListViewControllerDelegate;



@interface RandomRestaurauntListViewController : UIViewController

@property (weak, nonatomic) IBOutlet id<RandomRestaurauntListViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *restaurauntListButton;

- (IBAction)restaurauntListButtonHit:(id)sender;

- (void)customNavBar;

@end



@protocol RandomRestaurauntListViewControllerDelegate <NSObject>

@optional
- (void)goToLeftJaSliderFromRandomRestaurauntListViewController:(RandomRestaurauntListViewController *) randomRestaurauntList;

@end