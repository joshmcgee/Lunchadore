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
    
    self.starImage = [UIImage imageNamed:@"2Star.png"];
    self.starImageOutline = [UIImage imageNamed:@"2StarSkeleton.png"];
    
    [self.oneStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
    [self.twoStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
    [self.threeStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
    [self.fourStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
    [self.fiveStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        //[self presentModalViewController:composer animated:YES];
        [self presentViewController:composer animated:YES completion:nil];
    }
}

- (IBAction)oneStarButtonHit:(id)sender
{
    [self.oneStarButton setImage:self.starImage forState:UIControlStateNormal];
    [self.twoStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
    [self.threeStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
    [self.fourStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
    [self.fiveStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
}

- (IBAction)twoStarButtonHit:(id)sender
{
    [self.oneStarButton setImage:self.starImage forState:UIControlStateNormal];
    [self.twoStarButton setImage:self.starImage forState:UIControlStateNormal];
    [self.threeStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
    [self.fourStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
    [self.fiveStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
}

- (IBAction)threeStarButtonHit:(id)sender
{
    [self.oneStarButton setImage:self.starImage forState:UIControlStateNormal];
    [self.twoStarButton setImage:self.starImage forState:UIControlStateNormal];
    [self.threeStarButton setImage:self.starImage forState:UIControlStateNormal];
    [self.fourStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
    [self.fiveStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
}

- (IBAction)fourStarButtonHit:(id)sender
{
    [self.oneStarButton setImage:self.starImage forState:UIControlStateNormal];
    [self.twoStarButton setImage:self.starImage forState:UIControlStateNormal];
    [self.threeStarButton setImage:self.starImage forState:UIControlStateNormal];
    [self.fourStarButton setImage:self.starImage forState:UIControlStateNormal];
    [self.fiveStarButton setImage:self.starImageOutline forState:UIControlStateNormal];
}

- (IBAction)fiveStarButtonHit:(id)sender
{
    [self.oneStarButton setImage:self.starImage forState:UIControlStateNormal];
    [self.twoStarButton setImage:self.starImage forState:UIControlStateNormal];
    [self.threeStarButton setImage:self.starImage forState:UIControlStateNormal];
    [self.fourStarButton setImage:self.starImage forState:UIControlStateNormal];
    [self.fiveStarButton setImage:self.starImage forState:UIControlStateNormal];
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
