//
//  EmailListCell.m
//  DS Luch App
//
//  Created by Gary Johnston on 1/24/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import "EmailListCell.h"

@implementation EmailListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    self.emailLabel.hidden = NO;
    self.emailTextField.hidden = YES;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (self.delegate && [self.delegate respondsToSelector:@selector(alteredEmailAddressOnEmailListCell:)])
    {
        [self.delegate alteredEmailAddressOnEmailListCell:self];
    }
    self.emailLabel.text = self.emailTextField.text;
    self.emailLabel.hidden = NO;
    self.emailTextField.hidden = YES;
    
    return YES;
}

@end
