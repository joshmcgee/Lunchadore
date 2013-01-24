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

@property (weak, nonatomic) UIBarButtonItem *storeListBarButton;
@property (weak, nonatomic) UIButton *storeListButton;

@end

@implementation RandomRestaurauntListViewController

- (void)setup
{
    //[(UIView *)[[self.slotSpinner subviews] objectAtIndex:1] setHidden:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.restaurantName = [[NSBundle mainBundle] pathForResource:@"restaurantList" ofType:@"plist"];
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:self.restaurantName ];
    self.restaurantList = (NSArray *)[dic objectForKey:@"Restaurants"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.restaurantList count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.restaurantList[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // Hmmmm....
    [self toggleSpinner:self];
    NSLog(@"MADE A SELECTION");
}


@end
