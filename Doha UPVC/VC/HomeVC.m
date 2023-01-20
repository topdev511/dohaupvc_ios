//
//  HomeVC.m
//  Doha UPVC
//
//  Created by Star on 10/3/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "HomeVC.h"
#import "AboutVC.h"
#import "InquiryVC.h"
#import "ProductVC.h"
#import "GalleryVC.h"
#import "BranchVC.h"
#import "IntroVC.h"
#import "GoAutoSlideView.h"

extern Boolean isBack;

@interface HomeVC () <GoAutoSlideViewDataSource, GoAutoSlideViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *mContainerView;
@property (weak, nonatomic) IBOutlet UIView *mAboutView;
@property (weak, nonatomic) IBOutlet UIView *mProductView;
@property (weak, nonatomic) IBOutlet UIView *mGalleryView;
@property (weak, nonatomic) IBOutlet UIView *mInquiryView;
@property (weak, nonatomic) IBOutlet UIView *mMaintenanceView;
@property (weak, nonatomic) IBOutlet UIView *mBranchView;

@end

@implementation HomeVC {
    NSArray* images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [Common hideNavigationBar:self];
    
    images = @[@"content_front1.jpg", @"content_front2.jpg", @"content_front3.jpg", @"content_front4.jpg", @"content_front5.jpg", @"content_front6.jpg"];
    
    if([LanguageManager.currentLanguageCode isEqualToString:LANG_EN]) {
        images = @[@"content_front_en1.jpg", @"content_front_en2.jpg", @"content_front_en3.jpg", @"content_front_en4.jpg", @"content_front_en5.jpg", @"content_front_en6.jpg"];
    }
    
    GoAutoSlideView *slideView = [[GoAutoSlideView alloc] initWithFrame:CGRectMake(0, 0, self.mContainerView.frame.size.width, self.mContainerView.frame.size.height)];
    slideView.slideDuration = 6;
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
    //imageView.contentMode = UIViewContentModeCenter;
    [imageView setImage:[UIImage imageNamed:images[page]]];
    return imageView;
}
#pragma mark GoAutoSlideViewDelegate

- (void)goAutoSlideView:(GoAutoSlideView *)goAutoSlideView didTapViewPage:(NSInteger)page {
    NSLog(@"Page %@ taped", @(page));
}

- (IBAction)onBack:(id)sender {
    isBack = true;
    IntroVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"IntroVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onAboutDown:(id)sender {
    self.mAboutView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onAboutUp:(id)sender {
    self.mAboutView.backgroundColor = MAIN_COLOR;
    AboutVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AboutVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onProductDown:(id)sender {
    self.mProductView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onProductUp:(id)sender {
    self.mProductView.backgroundColor = MAIN_COLOR;
    ProductVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onGalleryDown:(id)sender {
    self.mGalleryView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onGalleryUp:(id)sender {
    self.mGalleryView.backgroundColor = MAIN_COLOR;
    GalleryVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onInquiryDown:(id)sender {
    self.mInquiryView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onInquiryUp:(id)sender {
    self.mInquiryView.backgroundColor = MAIN_COLOR;
    InquiryVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"InquiryVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onMaintenanceDown:(id)sender {
    self.mMaintenanceView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onMaintenanceUp:(id)sender {
    self.mMaintenanceView.backgroundColor = MAIN_COLOR;
    NSString *phoneNumber = [@"tel://" stringByAppendingString:@"97474743030"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber] options:@{} completionHandler:nil];
}

- (IBAction)onBranchDown:(id)sender {
    self.mBranchView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onBranchUp:(id)sender {
    self.mBranchView.backgroundColor = MAIN_COLOR;
    BranchVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"BranchVC"];
    [self.navigationController pushViewController:vc animated:YES];
}








@end
