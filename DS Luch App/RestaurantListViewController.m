//
//  RestaurantListViewController.m
//  DS Luch App
//
//  Created by Josh McGee on 1/4/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import "RestaurantListViewController.h"
#import "RandomRestaurauntListViewController.h"
#import "JASidePanelController.h"

@interface RestaurantListViewController ()

@end

@implementation RestaurantListViewController

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

    self.restaurantName = [[NSBundle mainBundle] pathForResource:@"restaurantList" ofType:@"plist"];
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:self.restaurantName ];
    self.restaurantList = (NSArray *)[dic objectForKey:@"Restaurants"];
    
    NSString *imageName = [[NSBundle mainBundle] pathForResource:@"restaurantImageList" ofType:@"plist"];
    NSDictionary *imageDic = [[NSDictionary alloc] initWithContentsOfFile:imageName];
    self.imageList = (NSArray *)[imageDic objectForKey:@"Restaurants"];
    
    NSString *rating = [[NSBundle mainBundle] pathForResource:@"restaurantRatingList" ofType:@"plist"];
    NSDictionary *ratingDic = [[NSDictionary alloc] initWithContentsOfFile:rating];
    self.ratingList = (NSArray *)[ratingDic objectForKey:@"Restaurants"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sortByName:(id)sender {
}

- (IBAction)sortByRating:(id)sender {
}

- (IBAction)sortByTime:(id)sender {
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.restaurantList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"idRestaurantCell";
    
    RestaurantListCell *cell = (RestaurantListCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];//forIndexPath:indexPath];
    cell.nameLabel.text = [self.restaurantList objectAtIndex:indexPath.row];
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"%@", [self.restaurantList objectAtIndex:indexPath.row]);
    //self.jaControllerIndexPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:indexPath.row];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectedARestaurant:restaurantName:rating:imageString:indexPathString:)])
    {
        [self.delegate selectedARestaurant:self restaurantName:[self.restaurantList objectAtIndex:indexPath.row] rating:[self.ratingList objectAtIndex:indexPath.row] imageString:[self.imageList objectAtIndex:indexPath.row] indexPathString:nil];
    }
}

@end
