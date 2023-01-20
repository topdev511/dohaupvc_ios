//
//  DesignWindowVC1.m
//  Doha UPVC
//
//  Created by Star on 11/15/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "DesignWindowVC1.h"
#import "ProductMD.h"
#import "ImageDetailVC.h"

#define CUSTOM_MAX 100000

@interface DesignWindowVC1 ()

@property (weak, nonatomic) IBOutlet UITextField *mWidthTF;
@property (weak, nonatomic) IBOutlet UITextField *mHeightTF;
@property (weak, nonatomic) IBOutlet UIImageView *mIV1;
@property (weak, nonatomic) IBOutlet UIImageView *mIV2;
@property (weak, nonatomic) IBOutlet UIImageView *mIV3;
@property (weak, nonatomic) IBOutlet UIImageView *mIV4;
@property (weak, nonatomic) IBOutlet UIImageView *mIV5;
@property (weak, nonatomic) IBOutlet UICollectionView *mCollectionView;
@property (weak, nonatomic) IBOutlet UIImageView *mRectIV;
@property (weak, nonatomic) IBOutlet UIImageView *mArchIV;

@property (strong, nonatomic) NSMutableArray* mData;
@property (strong, nonatomic) NSMutableArray* selectedProducts;

@property (nonatomic) BOOL isRect;
@property (nonatomic) int selColor;

@property (weak, nonatomic) IBOutlet UILabel *mTitleLB;
@property (weak, nonatomic) IBOutlet UILabel *mSpeLB;
@property (weak, nonatomic) IBOutlet UILabel *mWLB;
@property (weak, nonatomic) IBOutlet UILabel *mHLB;
@property (weak, nonatomic) IBOutlet UILabel *mRecLB;
@property (weak, nonatomic) IBOutlet UILabel *mArchLB;
@property (weak, nonatomic) IBOutlet UILabel *mColorLB;
@property (weak, nonatomic) IBOutlet UILabel *mGoldOakLB;
@property (weak, nonatomic) IBOutlet UILabel *mGrayLB;
@property (weak, nonatomic) IBOutlet UILabel *mIvoryLB;
@property (weak, nonatomic) IBOutlet UILabel *mMahoganyLB;
@property (weak, nonatomic) IBOutlet UILabel *mWhiteLB;


@end

@implementation DesignWindowVC1 {
    NSUInteger colomnCount;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.selectedProducts = [[NSMutableArray alloc] init];
    colomnCount = 3;
    
    [self loadData];
    
    self.mWidthTF.delegate = self;
    self.mHeightTF.delegate = self;
    
    if([self.selectedProducts count] != 0 && [self.selectedProducts count] < 3) {
        colomnCount = 2;//[self.selectedProducts count];
    } else {
        colomnCount = 3;
    }
    
    self.isRect = YES;
    self.selColor = 1;
        
    self.mRectIV.image = [UIImage imageNamed:@"ic_checked.png"];
    self.mIV1.image = [UIImage imageNamed:@"ic_checked.png"];
    
    self.mTitleLB.text = NSLocalizedString(@"Windows", @"");
    self.mSpeLB.text = NSLocalizedString(@"Please enter your specification", @"");
    self.mWLB.text = NSLocalizedString(@"Width(mm)", @"");
    self.mHLB.text = NSLocalizedString(@"Height(mm)", @"");
    self.mRecLB.text = NSLocalizedString(@"Rectangle", @"");
    self.mArchLB.text = NSLocalizedString(@"Arch", @"");
    self.mColorLB.text = NSLocalizedString(@"Color", @"");
    self.mGoldOakLB.text = NSLocalizedString(@"Gold Oak", @"");
    self.mGrayLB.text = NSLocalizedString(@"Gray", @"");
    self.mIvoryLB.text = NSLocalizedString(@"Ivory", @"");
    self.mMahoganyLB.text = NSLocalizedString(@"Mahogany", @"");
    self.mWhiteLB.text = NSLocalizedString(@"White", @"");
    
}

- (void) loadData {
    self.mData = [[NSMutableArray alloc] init];
    
    ProductMD *p = [[ProductMD alloc] init];
    
    p.design = @"Design1 (Tilt Opening)";
    p.title = @"Bathroom Window";
    p.width_from = 350;
    p.width_to = 800;
    p.height_from = 350;
    p.height_to = 600;
    p.open_height_from = 0;
    p.open_height_to = 0;
    p.isRect = YES;
    p.designId = 1;
    [self.mData addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design2 (Tilt Opening with fix)";
    p.title = @"Bathroom Window";
    p.width_from = 350;
    p.width_to = 800;
    p.height_from = 800;
    p.height_to = 1000;
    p.open_height_from = 0;
    p.open_height_to = 0;
    p.isRect = YES;
    p.designId = 2;
    [self.mData addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design3 (Sliding Single Rail)";
    p.title = @"Sliding Window";
    p.width_from = 800;
    p.width_to = 2200;
    p.height_from = 1600;
    p.height_to = 2200;
    p.open_height_from = 0;
    p.open_height_to = 0;
    p.isRect = YES;
    p.designId = 3;
    [self.mData addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design4 (1 Sash Opening)";
    p.title = @"Square Window (Signle Action)";
    p.width_from = 350;
    p.width_to = 850;
    p.height_from = 1600;
    p.height_to = 2200;
    p.open_height_from = 0;
    p.open_height_to = 0;
    p.isRect = YES;
    p.designId = 4;
    [self.mData addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design5 (1 Sash Opening and 1 Fix)";
    p.title = @"Square Window (Single Action)";
    p.width_from = 900;
    p.width_to = 1700;
    p.height_from = 350;
    p.height_to = 1600;
    p.open_height_from = 0;
    p.open_height_to = 0;
    p.isRect = YES;
    p.designId = 5;
    [self.mData addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design6 (1 Sash opening and 2 Fix)";
    p.title = @"Square Window (Single Action)";
    p.width_from = 1200;
    p.width_to = 2200;
    p.height_from = 350;
    p.height_to = 1600;
    p.open_height_from = 0;
    p.open_height_to = 0;
    p.isRect = YES;
    p.designId = 6;
    [self.mData addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design7 (1 Sash opening and 2 Fix)";
    p.title = @"Square Window (Double Action)";
    p.width_from = 1200;
    p.width_to = 2200;
    p.height_from = 850;
    p.height_to = 1600;
    p.open_height_from = 0;
    p.open_height_to = 0;
    p.isRect = YES;
    p.designId = 7;
    [self.mData addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design8 (1 Sash opening and 1 Fix)";
    p.title = @"Signle Action";
    p.width_from = 900;
    p.width_to = 1700;
    p.height_from = 0;
    p.height_to = CUSTOM_MAX;
    p.open_height_from = 350;
    p.open_height_to = 1600;
    p.isRect = NO;
    p.designId = 8;
    [self.mData addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design9 (1 Sash opening and 2 Fix)";
    p.title = @"Single Action";
    p.width_from = 1200;
    p.width_to = 2200;
    p.height_from = 0;
    p.height_to = CUSTOM_MAX;
    p.open_height_from = 350;
    p.open_height_to = 1600;
    p.isRect = NO;
    p.designId = 9;
    [self.mData addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design10 (1 Sash opening and 2 Fix)";
    p.title = @"Double Action";
    p.width_from = 350;
    p.width_to = 800;
    p.height_from = 0;
    p.height_to = CUSTOM_MAX;
    p.open_height_from = 850;
    p.open_height_to = 1600;
    p.isRect = NO;
    p.designId = 10;
    [self.mData addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design11 (Fixed)";
    p.title = @"Fixed Window";
    p.width_from = 350;
    p.width_to = 2300;
    p.height_from = 350;
    p.height_to = 2300;
    p.open_height_from = 0;
    p.open_height_to = 0;
    p.isRect = YES;
    p.designId = 11;
    [self.mData addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design12 (Tilt Opening)";
    p.title = @"Bathroom Arch Window";
    p.width_from = 350;
    p.width_to = 800;
    p.height_from = 0;
    p.height_to = CUSTOM_MAX;
    p.open_height_from = 350;
    p.open_height_to = 1000;
    p.isRect = NO;
    p.designId = 12;
    [self.mData addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design13 (1 Sasg Opening)";
    p.title = @"Arch Window (Single Action)";
    p.width_from = 350;
    p.width_to = 850;
    p.height_from = 0;
    p.height_to = CUSTOM_MAX;
    p.open_height_from = 350;
    p.open_height_to = 850;
    p.isRect = NO;
    p.designId = 13;
    [self.mData addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design14 (Sliding Single Rail)";
    p.title = @"Sliding Window";
    p.width_from = 800;
    p.width_to = 2500;
    p.height_from = 0;
    p.height_to = CUSTOM_MAX;
    p.open_height_from = 600;
    p.open_height_to = 2200;
    p.isRect = NO;
    p.designId = 14;
    [self.mData addObject:p];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onRect:(id)sender {
    self.isRect = YES;
    self.mArchIV.image = nil;
    self.mRectIV.image = [UIImage imageNamed:@"ic_checked.png"];
    
    [self filterProductWidth:self.mWidthTF.text Height:_mHeightTF.text];
    [self.mCollectionView reloadData];
}

- (IBAction)onArch:(id)sender {
    self.isRect = NO;
    self.mRectIV.image = nil;
    self.mArchIV.image = [UIImage imageNamed:@"ic_checked.png"];
    [self filterProductWidth:self.mWidthTF.text Height:_mHeightTF.text];
    [self.mCollectionView reloadData];
}

- (IBAction)onColor1:(id)sender {
    [self initColorIVs];
    [self.mIV1 setImage:[UIImage imageNamed:@"ic_checked.png"]];
    self.selColor = 1;
    
    [self.mCollectionView reloadData];
}

- (IBAction)onColor2:(id)sender {
    [self initColorIVs];
    [self.mIV2 setImage:[UIImage imageNamed:@"ic_checked.png"]];
    self.selColor = 2;
    
    [self.mCollectionView reloadData];
}

- (IBAction)onColor3:(id)sender {
    [self initColorIVs];
    [self.mIV3 setImage:[UIImage imageNamed:@"ic_checked.png"]];
    self.selColor = 3;
    
    [self.mCollectionView reloadData];
}

- (IBAction)onColor4:(id)sender {
    [self initColorIVs];
    [self.mIV4 setImage:[UIImage imageNamed:@"ic_checked.png"]];
    self.selColor = 4;
    
    [self.mCollectionView reloadData];
}

- (IBAction)onColor5:(id)sender {
    [self initColorIVs];
    [self.mIV5 setImage:[UIImage imageNamed:@"ic_checked.png"]];
    self.selColor = 5;
    
    [self.mCollectionView reloadData];
}

- (void)initColorIVs {
    self.mIV1.image = nil;
    self.mIV2.image = nil;
    self.mIV3.image = nil;
    self.mIV4.image = nil;
    self.mIV5.image = nil;
}

- (void) filterProductWidth:(NSString*)w Height:(NSString*)h {
    
    //[self showToast:[NSString stringWithFormat:@"%@, %@", w, h]];
    self.selectedProducts = [[NSMutableArray alloc] init];
    
    for (ProductMD* p in self.mData) {
        BOOL isProper = YES;
        
        if(self.isRect != p.isRect) {
            isProper = NO;
            continue;
        }
        
        if(![self isMatched:p Width:w Height:h]) {
            isProper = NO;
            continue;
        }
        
        [self.selectedProducts addObject:p];
        
        if([self.selectedProducts count] != 0 && [self.selectedProducts count] < 3) {
            colomnCount = 2;//[self.selectedProducts count];
        } else {
            colomnCount = 3;
        }        
    }
}

- (BOOL) isMatched: (ProductMD*) p Width: (NSString*) wStr Height: (NSString*) hStr {
    BOOL isMatch = YES;
    
    int w = wStr.intValue;
    int h = hStr.intValue;
    
    if (w < p.width_from || w > p.width_to) {
        isMatch = NO;
        return isMatch;
    }
    
    if (h < p.height_from || h > p.height_to) {
        isMatch = NO;
        return isMatch;
    }
    
    return isMatch;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.selectedProducts count];
    //return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //return CGSizeMake((self.view.frame.size.width-32)/colomnCount, (self.view.frame.size.width-32)/colomnCount);
    return CGSizeMake((self.mCollectionView.frame.size.width)/colomnCount, (self.mCollectionView.frame.size.width)/colomnCount);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell* cell = (UICollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"RID_WindowCollectionCell" forIndexPath:indexPath];
    
    ProductMD* p = self.selectedProducts[indexPath.row];
    UIImageView *iv = [cell viewWithTag:1];
    NSString* imageName = [NSString stringWithFormat:@"win_1p_%dd_%dc", p.designId, self.selColor];
    [iv setImage:[UIImage imageNamed:imageName]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductMD* p = self.selectedProducts[indexPath.row];
    NSString* imageName = [NSString stringWithFormat:@"win_1p_%dd_%dc", p.designId, self.selColor];
    ImageDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ImageDetailVC"];
    vc.imageName = imageName;
    [self.navigationController pushViewController:vc animated:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString* value = [NSString stringWithFormat:@"%@%@", textField.text, string];
    
    if([self.mWidthTF isEditing]) {
        [self filterProductWidth:value Height:self.mHeightTF.text];
    } else {
        [self filterProductWidth:self.mWidthTF.text Height:value];
    }
    [self.mCollectionView reloadData];
    return YES;
}

@end
