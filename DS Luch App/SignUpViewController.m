//
//  SignUpViewController.m
//  DS Luch App
//
//  Created by Gary Johnston on 1/24/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@property (assign, nonatomic)int spotInArray;
@property (strong, nonatomic)EmailListCell *tempCell;

- (void)showAlert:(NSString *)message
           result:(id)result
            error:(NSError *)error;
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
    
    self.spotInArray = 0;
    
    self.emailArray = [[NSMutableArray alloc] init];
    [self.emailArray addObject:@"josh@dsmedialabs.com"];
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
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:self.emailArray forKey:@"emailArray"];
    
    if (![self.nameTextField.text isEqualToString:@""])
    {
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"signedUp"];
        
        [defaults setObject:self.nameTextField.text forKey:@"name"];
        if (self.delegate && [self.delegate respondsToSelector:@selector(hitStartOnSignUp:)])
        {
            [self.delegate hitStartOnSignUp:self];
        }
    }
    else
    {
        [self createPopup];
        
        NSLog(@"Hello, Nobody!");
    }
}

- (void)createPopup
{
    PopupViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PopupViewController"];
    viewController.delegate = self;
    viewController.view.frame = self.view.bounds;
    viewController.view.alpha = 0.0f;
    
    [self.view addSubview:viewController.view];
    viewController.titleLabel.text = @"UH-OH!";
    viewController.messageLabel.text = @"You Must Enter Your Name Before You May Enter Lunchadore!";
    self.popupViewController = viewController;
    
    [UIView animateWithDuration:0.3f animations:^{
        viewController.view.alpha = 1.0f;
    }];
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
        if (![[self.emailArray objectAtIndex:indexPath.row-1] isEqualToString:@"enter new email"])
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

#pragma mark - alerts

- (void)showAlert:(NSString *)message
           result:(id)result
            error:(NSError *)error {
    
    NSString *alertMsg;
    NSString *alertTitle;
    if (error)
    {
        alertMsg = error.localizedDescription;
        alertTitle = @"Error";
    }
    else
    {
        alertMsg = @"You must enter a name to continue....";
        alertTitle = @"Failed!";
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertTitle
                                                        message:alertMsg
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}


#pragma mark - delegates

- (void)alteredEmailAddressOnEmailListCell:(EmailListCell *) emailListCell
{
    self.emailArray[self.spotInArray] = self.tempCell.emailTextField.text;
}

- (void)hitOkOnThePopupViewController:(PopupViewController *)popup
{
    self.popupViewController = nil;
}

@end
