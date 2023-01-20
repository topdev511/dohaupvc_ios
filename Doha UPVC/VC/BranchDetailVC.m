//
//  BranchDetailVC.m
//  Doha UPVC
//
//  Created by Star on 11/14/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "BranchDetailVC.h"

@interface BranchDetailVC ()
@property (weak, nonatomic) IBOutlet UIImageView *iv;
@property (weak, nonatomic) IBOutlet UILabel *mTakeLB;

@end

@implementation BranchDetailVC {
    double lat;
    double lng;
    NSString* phone;
    NSString* email;
    NSString* fax;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.       
    
    
    if([self.branchId isEqualToString:@"1"]) {
        [self.iv setImage:[UIImage imageNamed:@"back_branch1.jpg"]];
        lat = 25.239993;
        lng = 51.457769;
        phone = @"+974 44604022";
        fax = @"+974 44503022 ";
        email = @"kaher@dohaupvc.com";
    } else if ([self.branchId isEqualToString:@"2"]) {
        [self.iv setImage:[UIImage imageNamed:@"back_branch4.jpg"]];
        lat = 25.164122;
        lng = 51.597436;
        phone = @"+974 44219899";
        fax = @"+974 44761956";
        email = @"mena@dohaupvc.com";
    } else if ([self.branchId isEqualToString:@"3"]) {
        [self.iv setImage:[UIImage imageNamed:@"back_branch2.jpg"]];
        lat = 25.409177;
        lng = 51.421956;
        phone = @"+974 44730978";
        fax = @"+974 44651884";
        email = @"ahmed.h@dohaupvc.com";
    } else if ([self.branchId isEqualToString:@"4"]) {
        [self.iv setImage:[UIImage imageNamed:@"back_branch3.jpg"]];
        lat = 25.684755;
        lng = 51.495788;
        phone = @"+974 44329010";
        fax = @"+974 44342002";
        email = @"ahmedelshamy@dohaupvc.com";
    }
    
    self.mPhoneLB.text = phone;
    self.mFaxLB.text = fax;
    self.mEmalLB.text = email;
    self.mTakeLB.text = NSLocalizedString(@"Take me there", @"");
    self.mTitleLV.text = NSLocalizedString(@"Our Branches", @"");
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
- (IBAction)onTake:(id)sender {
    NSString* u = @"http://maps.google.com/maps?q=";
    NSString* url = [NSString stringWithFormat:@"%@%f,%f", u, lat, lng];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[url stringByReplacingOccurrencesOfString:@" " withString:@""]]];
}

@end
