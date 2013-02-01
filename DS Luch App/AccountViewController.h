//
//  AccountViewController.h
//  DS Luch App
//
//  Created by Gary Johnston on 1/30/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmailListCell.h"
#import "EmailListAddCell.h"
#import "PopupViewController.h"

@protocol AccountViewControllerDelegate;



@interface AccountViewController : UIViewController <UITextFieldDelegate, EmailListCellDelegate, PopupViewControllerDelegate>

@property (weak, nonatomic) id<AccountViewControllerDelegate> delegate;
@property (strong, nonatomic) PopupViewController *popupViewController;
@property (strong, nonatomic) EmailListCell *emailListCell;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITableView *emailTableView;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (assign, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *emailArray;

- (IBAction)saveButtonHit:(id)sender;

@end



@protocol AccountViewControllerDelegate <NSObject>

@optional
- (void)hitTheSaveButtonOnAccountViewController:(AccountViewController *) account;

@end