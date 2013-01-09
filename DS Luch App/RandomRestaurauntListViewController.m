//
//  RandomRestaurauntListViewController.m
//  DS Luch App
//
//  Created by Gary Johnston on 1/9/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import "RandomRestaurauntListViewController.h"
#import "JASidePanelController.h"

@interface RandomRestaurauntListViewController ()

@property (strong, nonatomic) UIBarButtonItem *storeListBarButton;
@property (strong, nonatomic) UIButton *storeListButton;
@property (assign, nonatomic) BOOL setListBarButtonToLeft;

@end

@implementation RandomRestaurauntListViewController

- (void)setup
{
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.setListBarButtonToLeft = YES;
    [self customNavBar];
}

- (void)customNavBar
{
    
    self.storeListButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, 60, 30)];
    [self.storeListButton addTarget:self action:@selector(restaurauntListButtonHit:) forControlEvents:UIControlEventTouchUpInside];
    [self.storeListButton setBackgroundImage:[[UIImage imageNamed:@"navbar-btn-backward"]resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 16.0f, 0.0, 6.0f)] forState:UIControlStateNormal];
    
    self.storeListBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.storeListButton];
    
    if (self.setListBarButtonToLeft)
    {
        self.parentViewController.navigationItem.leftBarButtonItem = self.storeListBarButton;
        self.parentViewController.navigationItem.rightBarButtonItem = nil;
        
        self.setListBarButtonToLeft = NO;
    }
    else
    {
        self.parentViewController.navigationItem.leftBarButtonItem = nil;
        self.parentViewController.navigationItem.rightBarButtonItem = self.storeListBarButton;
        
        self.setListBarButtonToLeft = YES;
    }
    
    
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

- (IBAction)restaurauntListButtonHit:(id)sender
{
    if ((self.delegate) && ([self.delegate respondsToSelector:@selector(goToLeftJaSliderFromRandomRestaurauntListViewController:)]))
    {
        [self.delegate goToLeftJaSliderFromRandomRestaurauntListViewController:self];
    }
}


@end
