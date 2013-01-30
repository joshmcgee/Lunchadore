//
//  AccountViewController.m
//  DS Luch App
//
//  Created by Gary Johnston on 1/30/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import "AccountViewController.h"

@interface AccountViewController ()

@property (assign, nonatomic)int spotInArray;
@property (strong, nonatomic)EmailListCell *tempCell;

@end

@implementation AccountViewController

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
    
    self.spotInArray = 0;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *tempArray = [defaults objectForKey:@"emailArray"];
    
    self.emailArray = [[NSMutableArray alloc] initWithArray:tempArray];
    
    self.name = [defaults objectForKey:@"name"];
    self.nameTextField.text = self.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)saveButtonHit:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.emailArray forKey:@"emailArray"];
    
    if (![self.nameTextField.text isEqualToString:@""])
    {
        [defaults setObject:self.nameTextField.text forKey:@"name"];
    }
    else
    {
        NSLog(@"Hello, Nobody!");
    }
}

#pragma mark - tableviews

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.emailArray  count]+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier;
    
    if (indexPath.row != [self.emailArray count])
    {
        cellIdentifier = @"emailCell";
        EmailListCell *cell = (EmailListCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        cell.delegate = self;
        if ([[self.emailArray objectAtIndex:indexPath.row] isEqualToString:@"enter new email"])
        {
            cell.emailTextField.placeholder = [self.emailArray objectAtIndex:indexPath.row];
            cell.emailLabel.text = cell.emailTextField.placeholder;
        }
        else
        {
            cell.emailTextField.text = [self.emailArray objectAtIndex:indexPath.row];
            cell.emailLabel.text = cell.emailTextField.text;
        }
        return cell;
    }
    else
    {
        cellIdentifier = @"addEmailCell";
        EmailListAddCell *cell = (EmailListAddCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath: %i", indexPath.row);
    if (indexPath.row == [self.emailArray count])
    {
        if (![[self.emailArray objectAtIndex:indexPath.row-1] isEqualToString:@"enter new email"]  && ![[self.emailArray objectAtIndex:indexPath.row-1] isEqualToString:@""])
        {
            [self.emailArray addObject:@"enter new email"];
            [self.emailTableView reloadData];
        }
        else
        {
            NSLog(@"DENIED!!!!");
        }
    }
    else
    {
        self.tempCell = (EmailListCell *)[tableView cellForRowAtIndexPath:indexPath];
        self.tempCell.emailLabel.hidden = YES;
        self.tempCell.emailTextField.hidden = NO;
        [self.tempCell.emailTextField becomeFirstResponder];
        self.spotInArray = indexPath.row;
    }
}

#pragma mark - delegates

- (void)alteredEmailAddressOnEmailListCell:(EmailListCell *) emailListCell
{
    if (![self.tempCell.emailTextField.text isEqualToString:@""])
    {
        self.emailArray[self.spotInArray] = self.tempCell.emailTextField.text;
    }
}
@end
