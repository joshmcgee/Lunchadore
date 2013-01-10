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
	// Do any additional setup after loading the view.
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
    NSString *title = @"Lunchadore";
    [composer setMailComposeDelegate:self];
    
    if ([MFMailComposeViewController canSendMail])
    {
        NSString *message = @"I am heading to ";
        NSMutableString *messageBodyText = [NSMutableString string];
        //UIImage *hukkImage = [UIImage imageNamed:@"icon.png"];
        
        
        // add HTML before the link here with line breaks (\n)
        NSString *formatString = [NSString stringWithFormat:@"<h1>%@</h1>\n", message];
        [messageBodyText appendString: formatString];
        //NSString *urlFormatString = [NSString stringWithFormat:@"<a href=\"https://http://www.hukkster.com/id561551472?mt=8\">%@</a>\n", @"Go To Hukkster"];
        //[messageBodyText appendString:urlFormatString];//@"<a href=\"https://itunes.apple.com/us/app/oakley-airwave/id561551472?mt=8\">Go to Oakley Aiwave!</a>\n"];
        [messageBodyText appendString:@"<div></div>\n"];
        
        [composer setSubject:title];
        [composer setToRecipients:[NSArray arrayWithObjects:@"", nil]];
        
        //NSData *myData = UIImageJPEGRepresentation(hukkImage, 1.0);
        //[composer addAttachmentData:myData mimeType:@"image/png" fileName:@""];
        [composer setMessageBody:(NSString*)messageBodyText isHTML:YES];
        composer.title = @"Lunchadore";
        [composer setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self presentModalViewController:composer animated:YES];
    }
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
