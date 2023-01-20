//
//  BranchDetailVC.h
//  Doha UPVC
//
//  Created by Star on 11/14/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "BaseVC.h"

@interface BranchDetailVC : BaseVC

@property (strong, nonatomic) NSString* branchId;
@property (weak, nonatomic) IBOutlet UILabel *mTitleLV;
@property (weak, nonatomic) IBOutlet UILabel *mPhoneLB;
@property (weak, nonatomic) IBOutlet UILabel *mFaxLB;
@property (weak, nonatomic) IBOutlet UILabel *mEmalLB;

@end
