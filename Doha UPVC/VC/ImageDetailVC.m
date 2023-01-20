//
//  ImageDetailVC.m
//  Doha UPVC
///Volumes/External/Projects/DohaUPVC/Project/DohaUPVC/Doha UPVC/VC/ImageDetailVC.h
//  Created by Star on 11/20/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "ImageDetailVC.h"

@interface ImageDetailVC ()
@property (weak, nonatomic) IBOutlet UILabel *mTitleLB;
@property (weak, nonatomic) IBOutlet UIImageView *iv;
@property (weak, nonatomic) IBOutlet UILabel *mCodeLB;

@end

@implementation ImageDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.iv.image = [UIImage imageNamed:self.imageName];
    self.mTitleLB.text = NSLocalizedString(@"Image", "");
    
    if(self.mCode != nil) {
        self.mCodeLB.text = self.mCode;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
