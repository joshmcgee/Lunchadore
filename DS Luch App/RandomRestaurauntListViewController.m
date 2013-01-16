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

@end

@implementation RandomRestaurauntListViewController

- (void)setup
{
    //[(UIView *)[[self.slotSpinner subviews] objectAtIndex:1] setHidden:YES];
}

- (void)viewWillAppear:(BOOL)animated
{

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
    }
    else
    {
        self.parentViewController.navigationItem.leftBarButtonItem = nil;
        self.parentViewController.navigationItem.rightBarButtonItem = self.storeListBarButton;
    }
    
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view.
    
    self.restaurantName = [[NSBundle mainBundle] pathForResource:@"restaurantList" ofType:@"plist"];
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:self.restaurantName ];
    self.restaurantList = (NSArray *)[dic objectForKey:@"Restaurants"];
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

- (IBAction)toggleSpinner:(id)sender
{
//    int randomNum = random() % [self.restaurantList count];
//    int currentRow = 0;
//    
//    for (; randomNum > 0; randomNum--)
//    {
//        [self.slotSpinner selectRow:currentRow inComponent:0 animated:YES];
//        //[self.slotSpinner reloadComponent:0];
//        currentRow += 1;
//    }
}


#pragma mark - Picker view data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [self.restaurantList count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.restaurantList[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // Hmmmm....
    [self toggleSpinner:self];
    NSLog(@"MADE A SELECTION");
}


@end
