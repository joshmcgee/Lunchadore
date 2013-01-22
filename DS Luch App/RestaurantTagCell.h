//
//  RestaurantTagCell.h
//  DS Luch App
//
//  Created by Gary Johnston on 1/22/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestaurantTagCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tagCell;

@end
