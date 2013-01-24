//
//  EmailListCell.h
//  DS Luch App
//
//  Created by Gary Johnston on 1/24/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EmailListCellDelegate;



@interface EmailListCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet id<EmailListCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@end




@protocol EmailListCellDelegate <NSObject>

@optional
- (void)alteredEmailAddressOnEmailListCell:(EmailListCell *) emailListCell;

@end