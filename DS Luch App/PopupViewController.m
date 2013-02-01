//
//  PopupViewController.m
//  Lunchadore
//
//  Created by Gary Johnston on 2/1/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import "PopupViewController.h"

@interface PopupViewController ()

@end

@implementation PopupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)okButtonHit:(id)sender
{
    [self.view removeFromSuperview];
    if (self.delegate && [self.delegate respondsToSelector:@selector(hitOkOnThePopupViewController:)])
    {
        [self.delegate hitOkOnThePopupViewController:self];
    }
}

@end
