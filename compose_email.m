// Compose Email
// Basic send / mail compose delegate
//
// IDECodeSnippetCompletionPrefix: compose email
        [self presentViewController:comp animated:YES completion:nil];
    }
    else{
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"" message:@"" delegate:nil cancelButtonTitle:@"" otherButtonTitles:nil, nil];
        [alrt show];

    }
}
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    if(error)
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"" message:@"" delegate:nil cancelButtonTitle:@"" otherButtonTitles:nil, nil];
        [alrt show];
        [self dismissModalViewControllerAnimated:YES];
    }
    else{
        [self dismissModalViewControllerAnimated:YES];
    }
composeEmail
// IDECodeSnippetCompletionScopes: [ClassImplementation]
// IDECodeSnippetIdentifier: FDEFE154-768F-4F62-A33F-7477C7D7DE75
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
#import <MessageUI/MessageUI.h>

- (void)sendEmail:(id)sender{
    
    // No email account setup.
    if (![MFMailComposeViewController canSendMail]) {
        [[[UIAlertView alloc] initWithTitle:@"Email Not Setup" message:@"Unfortunately, you have no email account available on your device." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil] show];
        return;
    }
    
    MFMailComposeViewController* mailVC = [[MFMailComposeViewController alloc] init];
    [mailVC setMailComposeDelegate:self];
    [mailVC setToRecipients:@[@"<#ReceipientEmail#>"]];
    [mailVC setSubject:@"<#Subject#>"];
    
    UIDevice* device = [UIDevice currentDevice];
    NSString* messageBody = <#MessageBody#>;
    
    [mailVC setMessageBody:messageBodyHTML isHTML:NO];
    
    // Show mail composer.
    [self presentViewController:mailVC animated:YES completion:nil];
    
}

#pragma mark - MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Feedback email cancelled.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Feedback email failed to send.");
            [[[UIAlertView alloc] initWithTitle:@"Email Send Error" message: [NSString stringWithFormat:@"Unfortunately, your email was not able to be sent. We're really sorry about that. [%@]",[error localizedDescription]] delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil] show];
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Feedback email saved.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Feedback email sent.");
            break;
        default:
            break;
    }
    
    //Add an alert in case of failure
    [self dismissViewControllerAnimated:YES completion:nil];
}