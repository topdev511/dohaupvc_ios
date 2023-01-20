//
//  Common.m
//  Foods
//
//  Created by Jin_Q on 3/17/16.
//  Copyright © 2016 Jin_Q. All rights reserved.
//

#import "Common.h"

@implementation Common

+ (UIStoryboard*) getStroyboard:(NSString*) storyboardName {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return sb;
}

+ (void) hideNavigationBar:(UIViewController*) viewController {
    [viewController.navigationController.navigationBar setHidden:YES];
}

+ (void) showNavigationBar:(UIViewController*) viewController {
    [viewController.navigationController.navigationBar setHidden:NO];
}

+ (CGFloat) getDevWidthWithMargin:(CGFloat) margin {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    return screenWidth - 2 * margin;
}

+ (void) setScrollViewHeight: (UIScrollView*) scrollView height: (float) height {
    CGRect rect = scrollView.frame;
    rect.size.height = height;
    scrollView.contentSize = rect.size;
}

+ (NSString *)convertHTML:(NSString *)html {
    
    NSScanner *myScanner;
    NSString *text = nil;
    myScanner = [NSScanner scannerWithString:html];
    
    while ([myScanner isAtEnd] == NO) {
        
        [myScanner scanUpToString:@"<" intoString:NULL] ;
        
        [myScanner scanUpToString:@">" intoString:&text] ;
        
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", text] withString:@""];
    }
    
    html = [html stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return html;
}

+ (NSString *) getValueKey:(NSString *)key {
    
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    
    if ([preferences objectForKey:key] == nil)
    {
        //  Doesn't exist.
        return nil;
    }
    else
    {
        //  Get current level
        NSString *value = [preferences stringForKey:key];
        return value;
    }
}

+ (void) saveValueKey:(NSString *)key
                Value:(NSString *)value {
    if(value==nil){
        value = @"";
    }
    if(value==(id)[NSNull null]){
        value = @"";
    }
    
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    
    [preferences setObject:value forKey:key];
    
    //  Save to disk
    const BOOL didSave = [preferences synchronize];
    
    if (!didSave)
    {
        //  Couldn't save (I've never seen this happen in real world testing)
    }
    
}

+(NSString *)replaceStringwithString:(NSString *)mainString strTobeReplaced:(NSString *)strTobeReplaced stringReplaceWith:(NSString *)stringReplaceWith
{
    return [mainString stringByReplacingOccurrencesOfString:strTobeReplaced withString:stringReplaceWith];
}

+(NSString *)removeSpaces:(NSString *)string
{
    return [string stringByReplacingOccurrencesOfString:@" " withString:@""];
}

+ (void) showSimpleAlertDlg:(UIViewController*)viewController Title:(NSString*)title Message:(NSString*)message {
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {}];
    [alert addAction:yesButton];
    [viewController presentViewController:alert animated:YES completion:nil];
    return;
}

+ (NSMutableArray *) getArrayFromCommaString:(NSString *)value
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    if(![value isEqualToString:@""]){
        NSArray* foo = [value componentsSeparatedByString: @","];
        result = [NSMutableArray arrayWithArray:foo];
    }
    
    return result;
}


+ (NSString *) getStringWithCommaFromArray:(NSMutableArray *)array
{
    NSString *result = array[0];
    
    for(int i=1; i<array.count; i++){
        result = [NSString stringWithFormat:@"%@,%@", result, array[i]];
    }
    
    return result;
}

+ (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)imageByCroppingImage:(UIImage *)image toSize:(CGSize)size
{
    // not equivalent to image.size (which depends on the imageOrientation)!
    double refWidth = CGImageGetWidth(image.CGImage);
    double refHeight = CGImageGetHeight(image.CGImage);
    
    double x = (refWidth - size.width) / 2.0;
    double y = (refHeight - size.height) / 2.0;
    
    CGRect cropRect = CGRectMake(x, y, size.height, size.width);
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], cropRect);
    
    UIImage *cropped = [UIImage imageWithCGImage:imageRef scale:0.0 orientation:image.imageOrientation];
    CGImageRelease(imageRef);
    
    return cropped;
}

+ (void) setShadow:(UIView*)v {
    v.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    v.layer.shadowOffset = CGSizeMake(1, 1);
    v.layer.shadowOpacity = 1;
    v.layer.shadowRadius = 1.0;
}

+ (UIImage *)blurredImageWithImage:(UIImage *)sourceImage{
    
    //  Create our blurred image
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:sourceImage.CGImage];
    
    //  Setting up Gaussian Blur
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:15.0f] forKey:@"inputRadius"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
        
    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
    
    UIImage *retVal = [UIImage imageWithCGImage:cgImage];
    return retVal;
}

+ (CGRect) getTextRect:(UILabel*)view Text:(NSString*) text MaxWidth:(float) maxWidth{
    CGRect textRect;
    view.lineBreakMode = NSLineBreakByWordWrapping;
    view.numberOfLines = 0;
    textRect = [text boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT)
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:@{NSFontAttributeName:((UILabel*)view).font}
                                  context:nil];
    
    CGFloat width = textRect.size.width * 1.03;
    CGFloat height = textRect.size.height * 1.03;
    textRect.size.width = width;
    textRect.size.height = height;
    
    return textRect;
}

+ (CGRect) getTextRect:(UILabel*)view Text:(NSString*) text MaxWidth:(float) maxWidth MaxHeight:(float) maxHeight{
    CGRect textRect;
    view.lineBreakMode = NSLineBreakByWordWrapping;
    view.numberOfLines = 0;
    textRect = [text boundingRectWithSize:CGSizeMake(maxWidth, maxHeight)
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:@{NSFontAttributeName:((UILabel*)view).font}
                                  context:nil];
    
    CGFloat width = textRect.size.width * 1.03;
    CGFloat height = textRect.size.height * 1.03;
    textRect.size.width = width;
    textRect.size.height = height;
    
    return textRect;
}

+ (NSString *)extractString:(NSString *)fullString toLookFor:(NSString *)lookFor skipForwardX:(NSInteger)skipForward toStopBefore:(NSString *)stopBefore
{
    
    NSRange firstRange = [fullString rangeOfString:lookFor];
    NSRange secondRange = [[fullString substringFromIndex:firstRange.location + skipForward] rangeOfString:stopBefore];
    NSRange finalRange = NSMakeRange(firstRange.location + skipForward, secondRange.location + [stopBefore length]);
    
    return [fullString substringWithRange:finalRange];
}

@end
