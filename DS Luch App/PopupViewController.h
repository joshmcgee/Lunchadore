//
//  PopupViewController.h
//  Lunchadore
//
//  Created by Gary Johnston on 2/1/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopupViewControllerDelegate;


@interface PopupViewController : UIViewController

@property (weak, nonatomic) id<PopupViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *messageLabel;
@property (strong, nonatomic) IBOutlet UIButton *okButton;

- (IBAction)okButtonHit:(id)sender;

@end



@protocol PopupViewControllerDelegate <NSObject>

@optional
- (void)hitOkOnThePopupViewController:(PopupViewController *)popup;

@end