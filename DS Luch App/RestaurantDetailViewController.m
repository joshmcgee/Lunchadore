//
//  RestaurantDetailViewController.m
//  DS Luch App
//
//  Created by Josh McGee on 1/4/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import "RestaurantDetailViewController.h"

@interface RestaurantDetailViewController ()

@end

@implementation RestaurantDetailViewController

- (void) setup
{
    //self.rating = 0;
    self.starImage = [UIImage imageNamed:@"2Star.png"];
    self.starImageOutline = [UIImage imageNamed:@"2StarSkeleton.png"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *tempArray = [defaults objectForKey:@"emailArray"];
    //NSString *emailString = @"josh@dsmedialabs.com";
    
    
    self.emailArray = [[NSArray alloc] initWithArray:tempArray];
    
    [self ratingSystem:self.rating];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
   //     [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
     //   [self setup];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self setup];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.navBar = [self.navigationBar.items objectAtIndex:0];
    self.navBar.title = self.title;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)backButtonHit:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(hitBackButtonOnDetailViewController:)])
    {
        [self.delegate hitBackButtonOnDetailViewController:self];
    }
    
}

- (IBAction)chooseButtonHit:(id)sender
{
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
    NSString *title = [NSString stringWithFormat:@"<insert name here> is heading to %@", self.title];
    [composer setMailComposeDelegate:self];
    
    if ([MFMailComposeViewController canSendMail])
    {
        NSString *message = [NSString stringWithFormat:@"I am going to %@ for lunch, would you like to join me?", self.title];
        NSMutableString *messageBodyText = [NSMutableString string];
        
        
        // add HTML before the link here with line breaks (\n)
        NSString *formatString = [NSString stringWithFormat:@"<h1>%@</h1>\n", message];
        [messageBodyText appendString: formatString];
        //NSString *urlFormatString = [NSString stringWithFormat:];
        //[messageBodyText appendString:urlFormatString];
        [messageBodyText appendString:@"<div></div>\n"];
        
        [composer setSubject:title];
        [composer setToRecipients:[NSArray arrayWithObjects:@"", nil]];
        
        //NSData *myData = UIImageJPEGRepresentation(hukkImage, 1.0);
        //[composer addAttachmentData:myData mimeType:@"image/png" fileName:@""];
        [composer setMessageBody:(NSString*)messageBodyText isHTML:YES];
        composer.title = @"Lunchadore";
        [composer setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [composer setToRecipients:self.emailArray];
        //[self presentModalViewController:composer animated:YES];
        [self presentViewController:composer animated:YES completion:nil];
    }
}

- (void)ratingSystem:(NSNumber *)rating
{
    //NSString * path = [self.ratingIndex stringByAppendingPathComponent:@"restaurantRatingList.plist"];
    
    if ([rating intValue] == 0)
    {
        [self.oneStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.twoStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.threeStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.fourStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.fiveStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
    }
    else if ([rating intValue] == 1)
    {
        [self.oneStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.twoStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.threeStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.fourStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.fiveStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
    }
    else if ([rating intValue] == 2)
    {
        [self.oneStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.twoStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.threeStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.fourStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.fiveStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
    }
    else if ([rating intValue] == 3)
    {
        [self.oneStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.twoStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.threeStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.fourStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.fiveStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
    }
    else if ([rating intValue] == 4)
    {
        [self.oneStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.twoStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.threeStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.fourStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.fiveStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
    }
    else if ([rating intValue] == 5)
    {
        [self.oneStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.twoStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.threeStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.fourStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.fiveStarButton setImage:self.starImage forState:UIControlStateNormal];
        
        //[NSKeyedArchiver archiveRootObject:self.rating toFile:path];
        //NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:@"restaurantRatingList" format:NSNumberFormatterNoStyle errorDescription:nil];
        //[plistData writeToFile:path atomically: YES];
    }
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setInteger:self.rating forKey:@"rating"];
}

- (IBAction)oneStarButtonHit:(id)sender
{
    self.rating = [NSNumber numberWithInt:1];
    [self ratingSystem:self.rating];
}

- (IBAction)twoStarButtonHit:(id)sender
{
    self.rating = [NSNumber numberWithInt:2];
    [self ratingSystem:self.rating];
}

- (IBAction)threeStarButtonHit:(id)sender
{
    self.rating = [NSNumber numberWithInt:3];
    [self ratingSystem:self.rating];
}

- (IBAction)fourStarButtonHit:(id)sender
{
    self.rating = [NSNumber numberWithInt:4];
    [self ratingSystem:self.rating];
}

- (IBAction)fiveStarButtonHit:(id)sender
{
    self.rating = [NSNumber numberWithInt:5];
    [self ratingSystem:self.rating];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    if (error)
    {
        NSString *message = @"Can't send message.";
        
        UIAlertView *mailAlert = [[UIAlertView alloc] initWithTitle:@"Please try again later."
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
        [mailAlert show];
        NSLog(@"%@",error);
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - tableview

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"idTagCell";
    
    RestaurantTagCell *cell = (RestaurantTagCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];//forIndexPath:indexPath];
    //cell.nameLabel.text = [self.restaurantList objectAtIndex:indexPath.row];
    
    return cell;
}


@end
