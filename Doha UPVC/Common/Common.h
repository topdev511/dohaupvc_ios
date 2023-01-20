//
//  Common.h
//  Foods
//
//  Created by Jin_Q on 3/17/16.
//  Copyright © 2016 Jin_Q. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Common : NSObject

// UI Part
+ (UIStoryboard*) getStroyboard:(NSString*) storyboardName;
+ (void) hideNavigationBar:(UIViewController*) viewController;
+ (void) showNavigationBar:(UIViewController*) viewController;
+ (void) showSimpleAlertDlg:(UIViewController*)viewController Title:(NSString*)title Message:(NSString*)message ;
+ (void) setShadow:(UIView*)v;
+ (void) setScrollViewHeight: (UIScrollView*) scrollView height: (float) height;

// NSUserDefault save read Part
+ (NSString *) getValueKey:(NSString *)key;
+ (void) saveValueKey:(NSString *)key
                Value:(NSString *)value ;

// Get Size
+ (CGFloat) getDevWidthWithMargin:(CGFloat) margin;
+ (CGRect) getTextRect:(UILabel*)view Text:(NSString*) text MaxWidth:(float) maxWidth;
+ (CGRect) getTextRect:(UILabel*)view Text:(NSString*) text MaxWidth:(float) maxWidth MaxHeight:(float) maxHeight;

// Convert Image, HTML
+ (NSString *)convertHTML:(NSString *)html;
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize; // without background (Recommed)
+ (UIImage *)imageByCroppingImage:(UIImage *)image toSize:(CGSize)size;
+ (UIImage *)blurredImageWithImage:(UIImage *)sourceImage;

// String
+(NSString *)replaceStringwithString:(NSString *)mainString strTobeReplaced:(NSString *)strTobeReplaced stringReplaceWith:(NSString *)stringReplaceWith;
+(NSString *)removeSpaces:(NSString *)string;
+ (NSString *)extractString:(NSString *)fullString toLookFor:(NSString *)lookFor skipForwardX:(NSInteger)skipForward toStopBefore:(NSString *)stopBefore;

// Convert String - Array
+ (NSString *) getStringWithCommaFromArray:(NSMutableArray *)array;
+ (NSMutableArray *) getArrayFromCommaString:(NSString *)value;

// French Food App Custom

@end
