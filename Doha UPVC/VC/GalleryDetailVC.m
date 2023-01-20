//
//  GalleryDetailVC.m
//  Doha UPVC
//
//  Created by Star on 10/20/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "GalleryDetailVC.h"
#import "GoAutoSlideView.h"

@interface GalleryDetailVC ()<GoAutoSlideViewDataSource, GoAutoSlideViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *mTitleLB;
@property (weak, nonatomic) IBOutlet UIView *mContainerView;

@end

@implementation GalleryDetailVC {
    GoAutoSlideView *slideView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.images = @[@"car1.jpg", @"car2.jpg", @"car3.jpg", @"car4.jpg"];
    
    self.mTitleLB.text = self.mTitle;
    
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

#pragma mark GoAutoSlideViewDataSource

- (NSInteger)numberOfPagesInGoAutoSlideView:(GoAutoSlideView *)goAutoSlideView {
    return [self.images count];
}

- (UIView *)goAutoSlideView:(GoAutoSlideView *)goAutoSlideView viewAtPage:(NSInteger)page {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.mContainerView.frame.size.width, self.mContainerView.frame.size.height)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [imageView setImage:[UIImage imageNamed:self.images[page]]];
    return imageView;
}
#pragma mark GoAutoSlideViewDelegate

- (void)goAutoSlideView:(GoAutoSlideView *)goAutoSlideView didTapViewPage:(NSInteger)page {
    NSLog(@"Page %@ taped", @(page));
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

- (IBAction)onPrev:(id)sender {
    [slideView prev];
}
- (IBAction)onNext:(id)sender {
    [slideView next];
}

@end
