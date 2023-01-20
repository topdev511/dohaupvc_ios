//
//  DesignWindowVC1.m
//  Doha UPVC
//
//  Created by Star on 11/15/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "DesignUPVCDoorVC1.h"
#import "ProductMD.h"
#import "ImageDetailVC.h"

#define CUSTOM_MAX 100000

@interface DesignUPVCDoorVC1 ()

@property (weak, nonatomic) IBOutlet UITextField *mWidthTF;
@property (weak, nonatomic) IBOutlet UITextField *mHeightTF;
@property (weak, nonatomic) IBOutlet UIImageView *mIV1;
@property (weak, nonatomic) IBOutlet UIImageView *mIV2;
@property (weak, nonatomic) IBOutlet UIImageView *mIV3;
@property (weak, nonatomic) IBOutlet UIImageView *mIV4;
@property (weak, nonatomic) IBOutlet UICollectionView *mCollectionView;
@property (weak, nonatomic) IBOutlet UIImageView *mRectIV;
@property (weak, nonatomic) IBOutlet UIImageView *mArchIV;

@property (strong, nonatomic) NSMutableArray* mData;
@property (strong, nonatomic) NSMutableArray* mData1;
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
@property (weak, nonatomic) IBOutlet UILabel *mMahoganyLB;
@property (weak, nonatomic) IBOutlet UILabel *mWhiteLB;

@end

@implementation DesignUPVCDoorVC1 {
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
    
    self.mTitleLB.text = NSLocalizedString(@"UPVC Doors", @"");
    self.mSpeLB.text = NSLocalizedString(@"Please enter your specification", @"");
    self.mWLB.text = NSLocalizedString(@"Width(mm)", @"");
    self.mHLB.text = NSLocalizedString(@"Height(mm)", @"");
    self.mRecLB.text = NSLocalizedString(@"Rectangle", @"");
    self.mArchLB.text = NSLocalizedString(@"Arch", @"");
    self.mColorLB.text = NSLocalizedString(@"Color", @"");
    self.mGoldOakLB.text = NSLocalizedString(@"Gold Oak", @"");
    self.mGrayLB.text = NSLocalizedString(@"Gray", @"");
    self.mMahoganyLB.text = NSLocalizedString(@"Mahogany", @"");
    self.mWhiteLB.text = NSLocalizedString(@"White", @"");
}

- (void) loadData {
    self.mData = [[NSMutableArray alloc] init];
    
    ProductMD *p = [[ProductMD alloc] init];
    
    NSArray* modelCode = @[@"8000", @"8400", @"8404", @"8405", @"8406", @"8474", @"8480", @"8482", @"8620", @"8621", @"Solid Door"];
    
    for (int i=0;i<11;i++) {
        p = [[ProductMD alloc] init];
        p.design = @"Design1 (Single Leaf Opening)";
        p.title = @"UPVC Panel Design";
        p.width_from = 850;
        p.width_to = 1100;
        p.height_from = 2000;
        p.height_to = 2300;
        p.open_height_from = 0;
        p.open_height_to = 0;
        p.isRect = YES;
        p.designId = 1;
        p.productId = i+1;
        p.modelCode = modelCode[i];
        [self.mData addObject:p];
        
        p = [[ProductMD alloc] init];
        p.design = @"Design2 (1 and half Leaf Opening)";
        p.title = @"UPVC Panel Design + Glass";
        p.width_from = 1200;
        p.width_to = 1600;
        p.height_from = 2000;
        p.height_to = 2300;
        p.open_height_from = 0;
        p.open_height_to = 0;
        p.isRect = YES;
        p.designId = 2;
        p.productId = i+1;
        p.modelCode = modelCode[i];
        [self.mData addObject:p];
        
        p = [[ProductMD alloc] init];
        p.design = @"Design3 (Double Opening)";
        p.title = @"UPVC Panel Design";
        p.width_from = 1700;
        p.width_to = 2200;
        p.height_from = 2000;
        p.height_to = 2300;
        p.open_height_from = 0;
        p.open_height_to = 0;
        p.isRect = YES;
        p.designId = 3;
        p.productId = i+1;
        p.modelCode = modelCode[i];
        [self.mData addObject:p];
        
        p = [[ProductMD alloc] init];
        p.design = @"Design4 (Single Leaf opening with fix on Top)";
        p.title = @"UPVC Panel Design + Glass";
        p.width_from = 850;
        p.width_to = 1100;
        p.height_from = 2400;
        p.height_to = 2900;
        p.open_height_from = 2000;
        p.open_height_to = 2300;
        p.isRect = YES;
        p.designId = 4;
        p.productId = i+1;
        p.modelCode = modelCode[i];
        [self.mData addObject:p];
        
        p = [[ProductMD alloc] init];
        p.design = @"Design5 (1 and half Leaf opening with fix on Top)";
        p.title = @"UPVC Panel Design + Glass";
        p.width_from = 1200;
        p.width_to = 1600;
        p.height_from = 2400;
        p.height_to = 2900;
        p.open_height_from = 2000;
        p.open_height_to = 2300;
        p.isRect = YES;
        p.designId = 5;
        p.productId = i+1;
        p.modelCode = modelCode[i];
        [self.mData addObject:p];
        
        p = [[ProductMD alloc] init];
        p.design = @"Design6 (Double Leaf opening with fix on Top)";
        p.title = @"UPVC Panel Design + Glass";
        p.width_from = 1700;
        p.width_to = 2200;
        p.height_from = 2400;
        p.height_to = 2900;
        p.open_height_from = 2000;
        p.open_height_to = 2300;
        p.isRect = YES;
        p.designId = 6;
        p.productId = i+1;
        p.modelCode = modelCode[i];
        [self.mData addObject:p];
        
        p = [[ProductMD alloc] init];
        p.design = @"Design7 (Single Leaf opening with Arch)";
        p.title = @"UPVC Panel Design + Glass";
        p.width_from = 850;
        p.width_to = 1100;
        p.height_from = 2600;
        p.height_to = 2900;
        p.open_height_from = 2000;
        p.open_height_to = 2300;
        p.isRect = NO;
        p.designId = 7;
        p.productId = i+1;
        p.modelCode = modelCode[i];
        [self.mData addObject:p];
        
        p = [[ProductMD alloc] init];
        p.design = @"Design8 (1 and half Leaf opening with Arch)";
        p.title = @"UPVC Panel Design + Glass";
        p.width_from = 1200;
        p.width_to = 1600;
        p.height_from = 2600;
        p.height_to = 2900;
        p.open_height_from = 2000;
        p.open_height_to = 2300;
        p.isRect = NO;
        p.designId = 8;
        p.productId = i+1;
        p.modelCode = modelCode[i];
        [self.mData addObject:p];
        
        p = [[ProductMD alloc] init];
        p.design = @"Design9 (Double Leaf opening with Arch)";
        p.title = @"UPVC Panel Design + Glass";
        p.width_from = 1700;
        p.width_to = 2200;
        p.height_from = 2600;
        p.height_to = 2900;
        p.open_height_from = 2000;
        p.open_height_to = 2900;
        p.isRect = NO;
        p.designId = 9;
        p.productId = i+1;
        p.modelCode = modelCode[i];
        [self.mData addObject:p];
    }
    
    self.mData1 = [[NSMutableArray alloc] init];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design1 (Single Leaf Opening)";
    p.title = @"UPVC Panel Design";
    p.width_from = 850;
    p.width_to = 1100;
    p.height_from = 2000;
    p.height_to = 2300;
    p.open_height_from = 0;
    p.open_height_to = 0;
    p.isRect = YES;
    p.designId = 1;
    p.productId = 11;
    p.modelCode = modelCode[10];
    [self.mData1 addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design2 (1 and half Leaf Opening)";
    p.title = @"UPVC Panel Design + Glass";
    p.width_from = 1200;
    p.width_to = 1600;
    p.height_from = 2000;
    p.height_to = 2300;
    p.open_height_from = 0;
    p.open_height_to = 0;
    p.isRect = YES;
    p.designId = 2;
    p.productId = 11;
    p.modelCode = modelCode[10];
    [self.mData1 addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design3 (Double Opening)";
    p.title = @"UPVC Panel Design";
    p.width_from = 1700;
    p.width_to = 2200;
    p.height_from = 2000;
    p.height_to = 2300;
    p.open_height_from = 0;
    p.open_height_to = 0;
    p.isRect = YES;
    p.designId = 3;
    p.productId = 11;
    p.modelCode = modelCode[10];
    [self.mData1 addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design4 (Single Leaf opening with fix on Top)";
    p.title = @"UPVC Panel Design + Glass";
    p.width_from = 850;
    p.width_to = 1100;
    p.height_from = 2400;
    p.height_to = 2900;
    p.open_height_from = 2000;
    p.open_height_to = 2300;
    p.isRect = YES;
    p.designId = 4;
    p.productId = 11;
    p.modelCode = modelCode[10];
    [self.mData1 addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design5 (1 and half Leaf opening with fix on Top)";
    p.title = @"UPVC Panel Design + Glass";
    p.width_from = 1200;
    p.width_to = 1600;
    p.height_from = 2400;
    p.height_to = 2900;
    p.open_height_from = 2000;
    p.open_height_to = 2300;
    p.isRect = YES;
    p.designId = 5;
    p.productId = 11;
    p.modelCode = modelCode[10];
    [self.mData1 addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design6 (Double Leaf opening with fix on Top)";
    p.title = @"UPVC Panel Design + Glass";
    p.width_from = 1700;
    p.width_to = 2200;
    p.height_from = 2400;
    p.height_to = 2900;
    p.open_height_from = 2000;
    p.open_height_to = 2300;
    p.isRect = YES;
    p.designId = 6;
    p.productId = 11;
    p.modelCode = modelCode[10];
    [self.mData1 addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design7 (Single Leaf opening with Arch)";
    p.title = @"UPVC Panel Design + Glass";
    p.width_from = 850;
    p.width_to = 1100;
    p.height_from = 2600;
    p.height_to = 2900;
    p.open_height_from = 2000;
    p.open_height_to = 2300;
    p.isRect = NO;
    p.designId = 7;
    p.productId = 11;
    p.modelCode = modelCode[10];
    [self.mData1 addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design8 (1 and half Leaf opening with Arch)";
    p.title = @"UPVC Panel Design + Glass";
    p.width_from = 1200;
    p.width_to = 1600;
    p.height_from = 2600;
    p.height_to = 2900;
    p.open_height_from = 2000;
    p.open_height_to = 2300;
    p.isRect = NO;
    p.designId = 8;
    p.productId = 11;
    p.modelCode = modelCode[10];
    [self.mData1 addObject:p];
    
    p = [[ProductMD alloc] init];
    p.design = @"Design9 (Double Leaf opening with Arch)";
    p.title = @"UPVC Panel Design + Glass";
    p.width_from = 1700;
    p.width_to = 2200;
    p.height_from = 2600;
    p.height_to = 2900;
    p.open_height_from = 2000;
    p.open_height_to = 2900;
    p.isRect = NO;
    p.designId = 9;
    p.productId = 11;
    p.modelCode = modelCode[10];
    [self.mData1 addObject:p];
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
    [self filterProductWidth:self.mWidthTF.text Height:_mHeightTF.text];
    [self.mCollectionView reloadData];
}

- (IBAction)onColor2:(id)sender {
    [self initColorIVs];
    [self.mIV2 setImage:[UIImage imageNamed:@"ic_checked.png"]];
    self.selColor = 2;
    [self filterProductWidth:self.mWidthTF.text Height:_mHeightTF.text];
    [self.mCollectionView reloadData];
}

- (IBAction)onColor3:(id)sender {
    [self initColorIVs];
    [self.mIV3 setImage:[UIImage imageNamed:@"ic_checked.png"]];
    self.selColor = 3;
    [self filterProductWidth:self.mWidthTF.text Height:_mHeightTF.text];
    [self.mCollectionView reloadData];
}

- (IBAction)onColor4:(id)sender {
    [self initColorIVs];
    [self.mIV4 setImage:[UIImage imageNamed:@"ic_checked.png"]];
    self.selColor = 4;
    [self filterProductWidth:self.mWidthTF.text Height:_mHeightTF.text];
    [self.mCollectionView reloadData];
}

- (void)initColorIVs {
    self.mIV1.image = nil;
    self.mIV2.image = nil;
    self.mIV3.image = nil;
    self.mIV4.image = nil;
}

- (void) filterProductWidth:(NSString*)w Height:(NSString*)h {
    self.selectedProducts = [[NSMutableArray alloc] init];
    NSMutableArray* temp = [[NSMutableArray alloc] init];
    
    if(self.selColor == 4) {
        temp = self.mData1;
    } else {
        temp = self.mData;
    }
    
    for (ProductMD* p in temp) {
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
    
    UICollectionViewCell* cell = (UICollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"RID_UPVCDoorCollectionCell" forIndexPath:indexPath];
    
    ProductMD* p = self.selectedProducts[indexPath.row];
    UIImageView *iv = [cell viewWithTag:1];
    NSString* imageName = [NSString stringWithFormat:@"upvc_%dp_%dd_%dc", p.productId, p.designId, self.selColor];
    [iv setImage:[UIImage imageNamed:imageName]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductMD* p = self.selectedProducts[indexPath.row];
    NSString* imageName = [NSString stringWithFormat:@"upvc_%dp_%dd_%dc", p.productId, p.designId, self.selColor];
    ImageDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ImageDetailVC"];
    vc.imageName = imageName;
    vc.mCode = p.modelCode;
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

