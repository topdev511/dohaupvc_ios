//
//  GalleryVC.m
//  Doha UPVC
//
//  Created by Star on 10/3/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "GalleryVC.h"
#import "GoAutoSlideView.h"
#import "DoorsGalleryVC.h"
#import "GlassGalleryVC.h"
#import "GalleryDetailVC.h"

@interface GalleryVC () <GoAutoSlideViewDataSource, GoAutoSlideViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *mContainerView;
@property (weak, nonatomic) IBOutlet UIView *mFrame7View;
@property (weak, nonatomic) IBOutlet UIView *mFrame6View;
@property (weak, nonatomic) IBOutlet UIView *mUPVCView;
@property (weak, nonatomic) IBOutlet UIView *mTentView;
@property (weak, nonatomic) IBOutlet UIView *mPVCView;
@property (weak, nonatomic) IBOutlet UIView *mWoodView;

@end

@implementation GalleryVC{
    NSArray* images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    images = @[@"ic_gallery_img.png"];
    GoAutoSlideView *slideView = [[GoAutoSlideView alloc] initWithFrame:CGRectMake(0, 0, self.mContainerView.frame.size.width, self.mContainerView.frame.size.height)];
    //slideView.slideDuration = 2;
    slideView.slideDelegate = self;
    slideView.slideDataSource = self;
    slideView.pageIndicatorColor = [UIColor clearColor];
    slideView.currentPageIndicatorColor = [UIColor clearColor];
    [self.mContainerView addSubview:slideView];
    [slideView reloadData];
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

#pragma mark GoAutoSlideViewDataSource

- (NSInteger)numberOfPagesInGoAutoSlideView:(GoAutoSlideView *)goAutoSlideView {
    return [images count];
}

- (UIView *)goAutoSlideView:(GoAutoSlideView *)goAutoSlideView viewAtPage:(NSInteger)page {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.mContainerView.frame.size.width, self.mContainerView.frame.size.height)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [imageView setImage:[UIImage imageNamed:images[page]]];
    return imageView;
}
#pragma mark GoAutoSlideViewDelegate

- (void)goAutoSlideView:(GoAutoSlideView *)goAutoSlideView didTapViewPage:(NSInteger)page {
    NSLog(@"Page %@ taped", @(page));
}

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onFrame7Down:(id)sender {
    self.mFrame7View.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onFrame7Up:(id)sender {
    self.mFrame7View.backgroundColor = MAIN_COLOR;
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_windows;
    vc.mTitle = NSLocalizedString(@"Windows", @"");
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onFrame6Down:(id)sender {
    self.mFrame6View.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onFrame6Up:(id)sender {
    self.mFrame6View.backgroundColor = MAIN_COLOR;
    DoorsGalleryVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DoorsGalleryVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onUPVCDown:(id)sender {
    self.mUPVCView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onUPVCUp:(id)sender {
    self.mUPVCView.backgroundColor = MAIN_COLOR;
    GlassGalleryVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GlassGalleryVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onTentsDown:(id)sender {
    self.mTentView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onTentsUp:(id)sender {
    self.mTentView.backgroundColor = MAIN_COLOR;
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_tents;
    vc.mTitle = NSLocalizedString(@"Tents", @"");
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onPVCDown:(id)sender {
    self.mPVCView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onPVCUp:(id)sender {
    self.mPVCView.backgroundColor = MAIN_COLOR;
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_pvc;
    vc.mTitle = NSLocalizedString(@"PVC Kitchen", @"");
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onWoodDown:(id)sender {
    self.mWoodView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onWoodUp:(id)sender {
    self.mWoodView.backgroundColor = MAIN_COLOR;
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_plastic;
    vc.mTitle = NSLocalizedString(@"Plastic Wood", @"");
    [self.navigationController pushViewController:vc animated:YES];
}

@end
