//
//  SignUpViewController.m
//  DS Luch App
//
//  Created by Gary Johnston on 1/24/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

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
    
    self.emailArray = [[NSMutableArray alloc] init];
    
    [self.emailArray addObject:@"duane@dsmedialabs.com"];
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

- (IBAction)startButtonHit:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"signedUp"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:self.emailArray forKey:@"emailArray"];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(hitStartOnSignUp:)])
    {
        [self.delegate hitStartOnSignUp:self];
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
        if ([self.emailArray objectAtIndex:indexPath.row] == @"enter new email")
        {
            cell.emailTextField.placeholder = [self.emailArray objectAtIndex:indexPath.row];
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
        if ([self.emailArray objectAtIndex:indexPath.row-1] != @"enter new email")
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
        EmailListCell *tempCell = (EmailListCell *)[tableView cellForRowAtIndexPath:indexPath];
        tempCell.emailLabel.hidden = YES;
        tempCell.emailTextField.hidden = NO;
        [tempCell.emailTextField becomeFirstResponder];
    }
}

#pragma mark - delegates

- (void)alteredEmailAddressOnEmailListCell:(EmailListCell *) emailListCell
{
    
}

@end
