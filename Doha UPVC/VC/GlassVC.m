//
//  GlassVC.m
//  Doha UPVC
//
//  Created by Star on 10/19/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "GlassVC.h"
#import "GalleryDetailVC.h"
#import "AppDelegate.h"

@interface GlassVC ()
@property (weak, nonatomic) IBOutlet UITextView *mTV1;
@property (weak, nonatomic) IBOutlet UITextView *mTV2;
@property (weak, nonatomic) IBOutlet UITextView *mTV3;
@property (weak, nonatomic) IBOutlet UITextView *mTV4;

@end

@implementation GlassVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if([LanguageManager.currentLanguageCode isEqualToString:LANG_EN]) {
        self.mTV1.textAlignment = NSTextAlignmentLeft;
        self.mTV2.textAlignment = NSTextAlignmentLeft;
        self.mTV3.textAlignment = NSTextAlignmentLeft;
        self.mTV4.textAlignment = NSTextAlignmentLeft;
    } else if ([LanguageManager.currentLanguageCode isEqualToString:LANG_AR]) {
        self.mTV1.textAlignment = NSTextAlignmentRight;
        self.mTV2.textAlignment = NSTextAlignmentRight;
        self.mTV3.textAlignment = NSTextAlignmentRight;
        self.mTV4.textAlignment = NSTextAlignmentRight;
    }
    
    self.mTV1.text = NSLocalizedString(@"glass_frameless", @"");
    self.mTV2.text = NSLocalizedString(@"glass_handrail", @"");
    self.mTV3.text = NSLocalizedString(@"glass_mirrors", @"");
    self.mTV4.text = NSLocalizedString(@"glass_showers", @"");
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
- (IBAction)onPreviousFrameless:(id)sender {
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_frameless_glass;
    vc.mTitle = NSLocalizedString(@"Frameless", @"");
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onHandrail:(id)sender {
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_handrail_glass;
    vc.mTitle = NSLocalizedString(@"Handrail", @"");
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onMirrors:(id)sender {
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_mirror_glass;
    vc.mTitle = NSLocalizedString(@"Mirrors", @"");
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onShowers:(id)sender {
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_shower_glass;
    vc.mTitle = NSLocalizedString(@"Showers", @"");
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
