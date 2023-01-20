//
//  BaseVC.h
//  FrenchFood
//
//  Created by weiquan zhang on 11/15/16.
//  Copyright © 2016 weiquan zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseVC : UIViewController

- (void) showLoading;
- (void) hideLoading;
- (void) showToast:(NSString*)message;
- (void) changeNavAnimDirectFromLeftToRight;
- (void) changeNavAnimDirectFromRightToLeft;
- (void) saveKey:(NSString*)key Value:(NSString*)value;
- (NSString*) getValueFromKey:(NSString*)key;

@property (nonatomic) int page;
@property (nonatomic) int limit;

@end
