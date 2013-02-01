//
//  SignUpViewController.h
//  DS Luch App
//
//  Created by Gary Johnston on 1/24/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmailListCell.h"
#import "EmailListAddCell.h"
#import "PopupViewController.h"

@protocol SignUpViewControllerDelegate;



@interface SignUpViewController : UIViewController <UITextFieldDelegate, EmailListCellDelegate, PopupViewControllerDelegate>

@property (weak, nonatomic) IBOutlet id<SignUpViewControllerDelegate> delegate;
@property (strong, nonatomic) EmailListCell *emailListCell;
@property (strong, nonatomic) PopupViewController *popupViewController;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITableView *emailTableView;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) NSMutableArray *emailArray;

- (IBAction)startButtonHit:(id)sender;

@end


@protocol SignUpViewControllerDelegate <NSObject>

@optional
- (void)hitStartOnSignUp:(SignUpViewController *) viewController;

@end