//
//  DesignWoodenDoorVC.m
//  Doha UPVC
//
//  Created by Star on 10/23/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "DesignWoodenDoorVC.h"
#import "GoAutoSlideView.h"

@interface DesignWoodenDoorVC () <GoAutoSlideViewDataSource, GoAutoSlideViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *mContainerView;
@property (weak, nonatomic) IBOutlet UILabel *mCountLB;
@property (weak, nonatomic) IBOutlet UIImageView *mColorIV1;
@property (weak, nonatomic) IBOutlet UIImageView *mColorIV2;
@property (weak, nonatomic) IBOutlet UIImageView *mColorIV3;
@property (weak, nonatomic) IBOutlet UIImageView *mColorIV4;
@property (weak, nonatomic) IBOutlet UIImageView *mColorIV5;
@property (weak, nonatomic) IBOutlet UIImageView *mColorIV6;


@property (weak, nonatomic) IBOutlet UILabel *mTitleLB;
@property (weak, nonatomic) IBOutlet UILabel *mDarkWalnutLB;
@property (weak, nonatomic) IBOutlet UILabel *mMapleLB;
@property (weak, nonatomic) IBOutlet UILabel *mTeakLB;
@property (weak, nonatomic) IBOutlet UILabel *mWalnutLB;
@property (weak, nonatomic) IBOutlet UILabel *mWhiteLB;
@property (weak, nonatomic) IBOutlet UILabel *mWhiteTeakLB;

@end

@implementation DesignWoodenDoorVC {
    GoAutoSlideView *slideView;
    NSInteger curIndex;
    NSInteger curColorIndex;
    NSArray* mCodes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    curIndex = 0;
    curColorIndex = 0;
    
    mCodes = @[@"100", @"1103", @"1122", @"1134", @"300", @"330", @"410"];
    
    self.mTitleLB.text = NSLocalizedString(@"Wooden Doors", @"");
    self.mDarkWalnutLB.text = NSLocalizedString(@"Dark Walnut", @"");
    self.mMapleLB.text = NSLocalizedString(@"Maple", @"");
    self.mTeakLB.text = NSLocalizedString(@"Teak", @"");
    self.mWalnutLB.text = NSLocalizedString(@"Walnut", @"");
    self.mWhiteLB.text = NSLocalizedString(@"White", @"");
    self.mWhiteTeakLB.text = NSLocalizedString(@"White Teak", @"");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    slideView = [[GoAutoSlideView alloc] initWithFrame:CGRectMake(0, 0, self.mContainerView.frame.size.width, self.mContainerView.frame.size.height)];
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
    return 7;
}

- (UIView *)goAutoSlideView:(GoAutoSlideView *)goAutoSlideView viewAtPage:(NSInteger)page {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.mContainerView.frame.size.width, self.mContainerView.frame.size.height)];
    
    NSString* imageName = [NSString stringWithFormat:@"wooden_%ldp_1d_%ldc.png", (page+1), (curColorIndex+1)];
    UIImage* image = [UIImage imageNamed:imageName];
    
    [imageView setImage:image];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    return imageView;
    
}

#pragma mark GoAutoSlideViewDelegate

- (void)goAutoSlideView:(GoAutoSlideView *)goAutoSlideView didTapViewPage:(NSInteger)page {
    NSLog(@"Page %@ taped", @(page));
}

- (void)goAutoSlideView:(GoAutoSlideView *)goAutoSlideView didMoveToPage:(NSInteger)page {
    curIndex = page;
    self.mCountLB.text = [NSString stringWithFormat:@"(%ld/7)", (curIndex+1)];
    self.mCodeLB.text = mCodes[page];
}

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)onPrev:(id)sender {
    [slideView prev];
}
- (IBAction)onNext:(id)sender {
    [slideView next];
}
- (void) refreshImage {
    NSInteger curSelIndex = curIndex;
    [slideView reloadData];
    curIndex = curSelIndex;
    [slideView moveTo:curSelIndex];
}

- (void)initColorIVs {
    self.mColorIV1.image = nil;
    self.mColorIV2.image = nil;
    self.mColorIV3.image = nil;
    self.mColorIV4.image = nil;
    self.mColorIV5.image = nil;
    self.mColorIV6.image = nil;
}

- (IBAction)onColor1:(id)sender {
    curColorIndex = 0;
    [self initColorIVs];
    self.mColorIV1.image = [UIImage imageNamed:@"ic_checked.png"];
    [self refreshImage];
}
- (IBAction)onColor2:(id)sender {
    curColorIndex = 1;
    [self initColorIVs];
    self.mColorIV2.image = [UIImage imageNamed:@"ic_checked.png"];
    [self refreshImage];
}
- (IBAction)onColor3:(id)sender {
    curColorIndex = 2;
    [self initColorIVs];
    self.mColorIV3.image = [UIImage imageNamed:@"ic_checked.png"];
    [self refreshImage];
}
- (IBAction)onColor4:(id)sender {
    curColorIndex = 3;
    [self initColorIVs];
    self.mColorIV4.image = [UIImage imageNamed:@"ic_checked.png"];
    [self refreshImage];
}
- (IBAction)onColor5:(id)sender {
    curColorIndex = 4;
    [self initColorIVs];
    self.mColorIV5.image = [UIImage imageNamed:@"ic_checked.png"];
    [self refreshImage];
}
- (IBAction)onColor6:(id)sender {
    curColorIndex = 5;
    [self initColorIVs];
    self.mColorIV6.image = [UIImage imageNamed:@"ic_checked.png"];
    [self refreshImage];
}

@end
