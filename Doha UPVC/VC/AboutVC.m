//
//  AboutVC.m
//  Doha UPVC
//
//  Created by Star on 10/3/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "AboutVC.h"

@interface AboutVC ()

@property (weak, nonatomic) IBOutlet UILabel *mLB1;
@property (weak, nonatomic) IBOutlet UILabel *mLB2;
@property (weak, nonatomic) IBOutlet UILabel *mLB3;
@property (weak, nonatomic) IBOutlet UILabel *mLB4;

@end

@implementation AboutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if([LanguageManager.currentLanguageCode isEqualToString:LANG_EN]) {
        self.mLB1.textAlignment = NSTextAlignmentLeft;
        self.mLB2.textAlignment = NSTextAlignmentLeft;
        self.mLB3.textAlignment = NSTextAlignmentLeft;
        self.mLB4.textAlignment = NSTextAlignmentLeft;
    } else if ([LanguageManager.currentLanguageCode isEqualToString:LANG_AR]) {
        self.mLB1.textAlignment = NSTextAlignmentRight;
        self.mLB2.textAlignment = NSTextAlignmentRight;
        self.mLB3.textAlignment = NSTextAlignmentRight;
        self.mLB4.textAlignment = NSTextAlignmentRight;
        
        int fontsize = 17;
        [self.mLB1 setFont:[UIFont systemFontOfSize:fontsize]];
        [self.mLB2 setFont:[UIFont systemFontOfSize:fontsize]];
        [self.mLB3 setFont:[UIFont systemFontOfSize:fontsize]];
        [self.mLB4 setFont:[UIFont systemFontOfSize:fontsize]];
        
    }
    
    self.mLB1.text = NSLocalizedString(@"who_we_are", @"");    
    self.mLB2.text = NSLocalizedString(@"our_mission", @"");
    self.mLB3.text = NSLocalizedString(@"why_upvc", @"");
    self.mLB4.text = NSLocalizedString(@"upvc_features", @"");
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

@end
