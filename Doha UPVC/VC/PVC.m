//
//  PVC.m
//  Doha UPVC
//
//  Created by Star on 10/19/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "PVC.h"
#import "GalleryDetailVC.h"
#import "AppDelegate.h"

@interface PVC ()
@property (weak, nonatomic) IBOutlet UITextView *mTV;
@property (weak, nonatomic) IBOutlet UILabel *mTurkeyLB;

@end

@implementation PVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if([LanguageManager.currentLanguageCode isEqualToString:LANG_EN]) {
        self.mTV.textAlignment = NSTextAlignmentLeft;
    } else if ([LanguageManager.currentLanguageCode isEqualToString:LANG_AR]) {
        self.mTV.textAlignment = NSTextAlignmentRight;
    }
    
    self.mTurkeyLB.text = NSLocalizedString(@"Made in Turkey", @"");
    self.mTV.text = NSLocalizedString(@"pvc_kichen", @"");
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
- (IBAction)onPrevious:(id)sender {
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_pvc;
    vc.mTitle = NSLocalizedString(@"PVC Kitchen", @"");
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
