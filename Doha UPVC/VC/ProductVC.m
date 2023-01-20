//
//  ProductVC.m
//  Doha UPVC
//
//  Created by Star on 10/3/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "ProductVC.h"
#import "WindowsVC.h"
#import "DoorsVC.h"
#import "GlassVC.h"
#import "PVC.h"
#import "TentsVC.h"
#import "WoodsVC.h"

@interface ProductVC ()
@property (weak, nonatomic) IBOutlet UIView *mFrame7View;
@property (weak, nonatomic) IBOutlet UIView *mFrame6View;
@property (weak, nonatomic) IBOutlet UIView *mUPVCView;
@property (weak, nonatomic) IBOutlet UIView *mTentView;
@property (weak, nonatomic) IBOutlet UIView *mPVCView;
@property (weak, nonatomic) IBOutlet UIView *mWoodView;

@end

@implementation ProductVC

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
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onFrame7Down:(id)sender {
    self.mFrame7View.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onFrame7Up:(id)sender {
    
    self.mFrame7View.backgroundColor = MAIN_COLOR;
    //ProductDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetailVC"];
    //vc.title = @"7cm Frame";
    WindowsVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"WindowsVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onFrame6Down:(id)sender {
    self.mFrame6View.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onFrame6Up:(id)sender {
    self.mFrame6View.backgroundColor = MAIN_COLOR;
    //ProductDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetailVC"];
    //vc.title = @"6cm Frame";
    DoorsVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DoorsVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onUPVCDown:(id)sender {
    self.mUPVCView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onUPVCUp:(id)sender {
    self.mUPVCView.backgroundColor = MAIN_COLOR;
    //ProductDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetailVC"];
    //vc.title = @"UPVC Doors";
    GlassVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GlassVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onTentsDown:(id)sender {
    self.mTentView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onTentsUp:(id)sender {
    self.mTentView.backgroundColor = MAIN_COLOR;
    //ProductDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetailVC"];
    //vc.title = @"Tents";
    TentsVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TentsVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onPVCDown:(id)sender {
    self.mPVCView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onPVCUp:(id)sender {
    self.mPVCView.backgroundColor = MAIN_COLOR;
    //ProductDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetailVC"];
    //vc.title = @"PVC Kitchen";
    PVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"PVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onWoodDown:(id)sender {
    self.mWoodView.backgroundColor = CLICKED_COLOR;
}

- (IBAction)onWoodUp:(id)sender {
    self.mWoodView.backgroundColor = MAIN_COLOR;
    //ProductDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetailVC"];
    //vc.title = @"Plastic Wood";
    WoodsVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"WoodsVC"];
    [self.navigationController pushViewController:vc animated:YES];
}







@end
