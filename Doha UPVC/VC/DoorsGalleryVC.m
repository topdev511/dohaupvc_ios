//
//  DoorsGalleryVC.m
//  Doha UPVC
//
//  Created by Star on 10/19/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "DoorsGalleryVC.h"
#import "GalleryDetailVC.h"

@interface DoorsGalleryVC ()
@property (weak, nonatomic) IBOutlet UIView *mUPVCView;
@property (weak, nonatomic) IBOutlet UIView *mWoodenView;

@end

@implementation DoorsGalleryVC

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

- (IBAction)onUPVCDown:(id)sender {
    self.mUPVCView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onUPVCDoors:(id)sender {
    self.mUPVCView.backgroundColor = MAIN_COLOR;
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_upvc_doors;
    vc.mTitle = NSLocalizedString(@"UPVC Doors", @"");
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onWoodenDown:(id)sender {
    self.mWoodenView.backgroundColor = CLICKED_COLOR;
}
- (IBAction)onWoodenDoors:(id)sender {
    self.mWoodenView.backgroundColor = MAIN_COLOR;
    GalleryDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GalleryDetailVC"];
    vc.images = gallery_wooden_doors;
    vc.mTitle = NSLocalizedString(@"Wooden Doors", @"");
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
