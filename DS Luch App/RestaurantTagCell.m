//
//  RestaurantTagCell.m
//  DS Luch App
//
//  Created by Gary Johnston on 1/22/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import "RestaurantTagCell.h"

@implementation RestaurantTagCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
