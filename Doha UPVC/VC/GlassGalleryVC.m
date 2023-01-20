//
//  GlassGalleryVC.m
//  Doha UPVC
//
//  Created by Star on 10/19/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "GlassGalleryVC.h"
#import "GalleryDetailVC.h"

@interface GlassGalleryVC ()
@property (weak, nonatomic) IBOutlet UIView *mFramelessView;
@property (weak, nonatomic) IBOutlet UIView *mHandrailView;
@property (weak, nonatomic) IBOutlet UIView *mMirrorView;
@property (weak, nonatomic) IBOutlet UIView *mShowersView;

@end

@implementation GlassGalleryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (IBAction)onFramelessDown:(id)sender {
    self.mFramelessView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onFrameless:(id)sender {
    self.mFramelessView.backgroundColor = MAIN_COLOR;
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_frameless_glass;
    vc.mTitle = NSLocalizedString(@"Frameless", @"");
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onHandrailDown:(id)sender {
    self.mHandrailView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onHandrail:(id)sender {
    self.mHandrailView.backgroundColor = MAIN_COLOR;
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_handrail_glass;
    vc.mTitle = NSLocalizedString(@"Handrail", @"");
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onMirrorDown:(id)sender {
    self.mMirrorView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onMirrors:(id)sender {
    self.mMirrorView.backgroundColor = MAIN_COLOR;
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_mirror_glass;
    vc.mTitle = NSLocalizedString(@"Mirrors", @"");
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onShowersDown:(id)sender {
    self.mShowersView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onShowers:(id)sender {
    self.mShowersView.backgroundColor = MAIN_COLOR;
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_shower_glass;
    vc.mTitle = NSLocalizedString(@"Showers", @"");
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
