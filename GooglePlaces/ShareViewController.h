//
//  ShareViewController.h
//  GooglePlaces
//
//  Created by iMac on 4/5/14.
//
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <MessageUI/MessageUI.h>

@interface ShareViewController : UIViewController <MFMailComposeViewControllerDelegate>
{
    SLComposeViewController *mySLComposerSheet;
}
- (IBAction)shareToFacebook:(id)sender;
- (IBAction)shareToTwitter:(id)sender;
- (IBAction)shareToEmail:(id)sender;
- (IBAction)emailMe:(id)sender;

@end
