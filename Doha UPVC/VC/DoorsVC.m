//
//  DoorsVC.m
//  Doha UPVC
//
//  Created by Star on 10/19/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "DoorsVC.h"
#import "GalleryDetailVC.h"
#import "AppDelegate.h"
#import "DesignUPVCDoorVC1.h"
#import "DesignWoodenDoorVC.h"


@interface DoorsVC ()
@property (weak, nonatomic) IBOutlet UITextView *mTV1;
@property (weak, nonatomic) IBOutlet UITextView *mTV2;
@property (weak, nonatomic) IBOutlet UILabel *mTurkeyLB1;
@property (weak, nonatomic) IBOutlet UILabel *mGreeceLB;
@property (weak, nonatomic) IBOutlet UILabel *mTurkey2;


@end

@implementation DoorsVC

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
    
    self.mTurkeyLB1.text = NSLocalizedString(@"Made in Turkey", @"");
    self.mTurkey2.text = NSLocalizedString(@"Made in Turkey", @"");
    self.mGreeceLB.text = NSLocalizedString(@"Made in Greece", @"");
    
    self.mTV1.text = NSLocalizedString(@"upvc_doors", @"");
    self.mTV2.text = NSLocalizedString(@"wooden_doors", @"");
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

- (IBAction)onDesignDoor:(id)sender {
    DesignUPVCDoorVC1* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DesignUPVCDoorVC1"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onPreviousDoor:(id)sender {
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_upvc_doors;
    vc.mTitle = NSLocalizedString(@"UPVC Doors", @"");
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onDesignWooden:(id)sender {
    DesignWoodenDoorVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DesignWoodenDoorVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onPreviousWooden:(id)sender {
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_wooden_doors;
    vc.mTitle = NSLocalizedString(@"Wooden Doors", @"");
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
