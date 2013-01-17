//
//  RestaurantDetailViewController.m
//  DS Luch App
//
//  Created by Josh McGee on 1/4/13.
//  Copyright (c) 2013 DSMediaLabs. All rights reserved.
//

#import "RestaurantDetailViewController.h"

@interface RestaurantDetailViewController ()

@property (assign, nonatomic) int rating;

@end

@implementation RestaurantDetailViewController

- (void) setup
{
    self.rating = 0;
    self.starImage = [UIImage imageNamed:@"2Star.png"];
    self.starImageOutline = [UIImage imageNamed:@"2StarSkeleton.png"];
    
    // TEMP STRING
    NSString *emailString = @"josh@dsmedialabs.com";
    
    
    self.emailArray = [[NSArray alloc] initWithObjects:emailString, nil]; // Gary J: later we can do initWithArray: and pass in the emails from the account
    
    [self ratingSystem:0];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setup];
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
    NSString *title = @"testing lunchadore";//[NSString stringWithFormat:@"<insert name here> is heading to %@", self.title];
    [composer setMailComposeDelegate:self];
    
    if ([MFMailComposeViewController canSendMail])
    {
        NSString *message = [NSString stringWithFormat:@"I am heading to %@ for lunch, would you like to join me?", self.title];
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

- (void)ratingSystem:(int)rating
{
    if (rating == 0)
    {
        [self.oneStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.twoStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.threeStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.fourStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.fiveStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
    }
    else if (rating == 1)
    {
        [self.oneStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.twoStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.threeStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.fourStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.fiveStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        
        self.rating = 1;
    }
    else if (rating == 2)
    {
        
        [self.oneStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.twoStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.threeStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.fourStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.fiveStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        
        self.rating = 2;
    }
    else if (rating == 3)
    {
        [self.oneStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.twoStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.threeStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.fourStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        [self.fiveStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        
        self.rating = 3;
    }
    else if (rating == 4)
    {
        [self.oneStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.twoStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.threeStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.fourStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.fiveStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
        
        self.rating = 4;
    }
    else if (rating == 5)
    {
        [self.oneStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.twoStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.threeStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.fourStarButton setImage:self.starImage forState:UIControlStateNormal];
        [self.fiveStarButton setImage:self.starImage forState:UIControlStateNormal];
        
        self.rating = 5;
    }
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setInteger:self.rating forKey:@"rating"];
}

- (IBAction)oneStarButtonHit:(id)sender
{
    [self ratingSystem:1];
}

- (IBAction)twoStarButtonHit:(id)sender
{
    [self ratingSystem:2];
}

- (IBAction)threeStarButtonHit:(id)sender
{
    [self ratingSystem:3];
}

- (IBAction)fourStarButtonHit:(id)sender
{
    [self ratingSystem:4];
}

- (IBAction)fiveStarButtonHit:(id)sender
{
    [self ratingSystem:5];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    if (error) {
        NSString *message = @"Can't send message.";
        
        UIAlertView *mailAlert = [[UIAlertView alloc] initWithTitle:@"Please try again later."
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
        [mailAlert show];
        NSLog(@"%@",error);
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
