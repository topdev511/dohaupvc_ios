//
//  WindowsVC.m
//  Doha UPVC
//
//  Created by Star on 10/19/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "WindowsVC.h"
#import "GalleryDetailVC.h"
#import "AppDelegate.h"
#import "DesignWindowVC1.h"

@interface WindowsVC ()
@property (weak, nonatomic) IBOutlet UITextView *mTV1;
@property (weak, nonatomic) IBOutlet UITextView *mTV2;
@property (weak, nonatomic) IBOutlet UILabel *mTurkeyLB;
@property (weak, nonatomic) IBOutlet UILabel *mGermanyLB;

@end

@implementation WindowsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if([LanguageManager.currentLanguageCode isEqualToString:LANG_EN]) {
        self.mTV1.textAlignment = NSTextAlignmentLeft;
        self.mTV2.textAlignment = NSTextAlignmentLeft;
    } else if ([LanguageManager.currentLanguageCode isEqualToString:LANG_AR]) {
        self.mTV1.textAlignment = NSTextAlignmentRight;
        self.mTV2.textAlignment = NSTextAlignmentRight;
    }
    
    self.mTurkeyLB.text = NSLocalizedString(@"Made in Turkey", @"");
    self.mGermanyLB.text = NSLocalizedString(@"Made in Germany", @"");
    self.mTV1.text = NSLocalizedString(@"frame6", @"");
    self.mTV2.text = NSLocalizedString(@"frame7", @"");
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
- (IBAction)onDesign6:(id)sender {
    DesignWindowVC1* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DesignWindowVC1"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onPrevious6:(id)sender {
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_windows;
    vc.mTitle = NSLocalizedString(@"Windows", @"");
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onDesign7:(id)sender {
    DesignWindowVC1* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DesignWindowVC1"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onPrevious7:(id)sender {
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_windows;
    vc.mTitle = NSLocalizedString(@"Windows", @"");
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
