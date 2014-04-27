//
//  ShareViewController.m
//  GooglePlaces
//
//  Created by iMac on 4/5/14.
//
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)shareToFacebook:(id)sender {
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) //check if Facebook Account is linked
    {
        mySLComposerSheet = [[SLComposeViewController alloc] init]; //initiate the Social Controller
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook]; //Tell him with what social plattform to use it, e.g. facebook or twitter
        [mySLComposerSheet setInitialText:[NSString stringWithFormat:@"Using this amazing app to find practical places near me!"]]; //the message you want to post
        
        //  [mySLComposerSheet addImage:yourimage]; //an image you could post
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    }
    [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSString *output;
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"Action Cancelled";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Post Successfull";
                break;
            default:
                break;
        } //check if everything worked properly. Give out a message on the state.
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook" message:output delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];

}

- (IBAction)shareToTwitter:(id)sender {
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"Using this amazing app to find practical places near me!"];
        
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }

}

- (IBAction)shareToEmail:(id)sender {
    
    MFMailComposeViewController *mViewController = [[MFMailComposeViewController alloc] init];
    mViewController.mailComposeDelegate = self;
    [mViewController setSubject:@"Check out this Map app!"];
    [mViewController setMessageBody:@"Using this amazing app to find practical places near me!" isHTML:NO];
    
    [self presentViewController:mViewController animated:YES completion:nil];

}

- (IBAction)emailMe:(id)sender {
    
    MFMailComposeViewController *mViewController = [[MFMailComposeViewController alloc] init];
    mViewController.mailComposeDelegate = self;
    NSArray *myArray = [NSArray arrayWithObject:@"doc92606@gmail.com"];
    [mViewController setToRecipients:myArray];
    [mViewController setSubject:@"Edit Subject here"];
    [mViewController setMessageBody:@"Dear Faisal," isHTML:NO];
    
    [self presentViewController:mViewController animated:YES completion:nil];

}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    
    if (result == MFMailComposeResultSent) {
        NSLog(@"It's away!");
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
