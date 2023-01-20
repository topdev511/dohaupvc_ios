//
//  InquiryVC.m
//  Doha UPVC
//
//  Created by Star on 10/3/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "InquiryVC.h"
#import <MessageUI/MessageUI.h>

@interface InquiryVC () <MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *mNameET;
@property (weak, nonatomic) IBOutlet UITextField *mEmailET;
@property (weak, nonatomic) IBOutlet UITextField *mNumberET;
@property (weak, nonatomic) IBOutlet UITextView *mMessageET;

@end

@implementation InquiryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if([LanguageManager.currentLanguageCode isEqualToString:LANG_EN]) {
        self.mNameET.textAlignment = NSTextAlignmentLeft;
        self.mEmailET.textAlignment = NSTextAlignmentLeft;
        self.mNumberET.textAlignment = NSTextAlignmentLeft;
        self.mMessageET.textAlignment = NSTextAlignmentLeft;
    } else if ([LanguageManager.currentLanguageCode isEqualToString:LANG_AR]) {
        self.mNameET.textAlignment = NSTextAlignmentRight;
        self.mEmailET.textAlignment = NSTextAlignmentRight;
        self.mNumberET.textAlignment = NSTextAlignmentRight;
        self.mMessageET.textAlignment = NSTextAlignmentRight;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)onSubmit:(id)sender {
    if(self.mNameET.text == nil || [self.mNameET.text isEqualToString:@""]) {
        [self showToast:@"Please input name"];
        return;
    }
    
    if(self.mEmailET.text == nil || [self.mEmailET.text isEqualToString:@""]) {
        [self showToast:@"Please input email"];
        return;
    }
    
    if(self.mNumberET.text == nil || [self.mNumberET.text isEqualToString:@""]) {
        [self showToast:@"Please input Phone number"];
        return;
    }
    
    NSString* message = [NSString stringWithFormat:@"Name: %@\n Email: %@\n PhoneNumber: %@\n %@", self.mNameET.text, self.mEmailET.text, self.mNumberET.text, self.mMessageET.text];
    
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        mail.mailComposeDelegate = self;
        //[mail setSubject:@"Sample Subject"];
        [mail setMessageBody:message isHTML:NO];
        [mail setToRecipients:@[@"dohaupvc@hotmail.com"]];
        [self presentViewController:mail animated:YES completion:NULL];
    } else {
        NSLog(@"This device cannot send email");
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"You sent the email.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"You saved a draft of this email");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"You cancelled sending this email.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed:  An error occurred when trying to compose this email");
            break;
        default:
            NSLog(@"An error occurred when trying to compose this email");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
