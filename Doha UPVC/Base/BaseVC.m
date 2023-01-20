//
//  BaseVC.m
//  FrenchFood
//
//  Created by weiquan zhang on 11/15/16.
//  Copyright © 2016 weiquan zhang. All rights reserved.
//

#import "BaseVC.h"


@interface BaseVC ()

@end

@implementation BaseVC {
    RTSpinKitView *spinner;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Loading part
    spinner = [[RTSpinKitView alloc] initWithStyle:RTSpinKitViewStyleCircle color:MAIN_COLOR];
    //spinner.spinnerSize = 70;
    //[spinner sizeToFit];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    spinner.center = CGPointMake(CGRectGetMidX(screenBounds), CGRectGetMidY(screenBounds));
    [self.view addSubview:spinner];
    [spinner setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) changeNavAnimDirectFromLeftToRight {
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    transition.subtype = kCATransitionFromLeft; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    //[[self navigationController] popViewControllerAnimated:NO];
}

- (void) changeNavAnimDirectFromRightToLeft {
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    transition.subtype = kCATransitionFromRight; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    //[[self navigationController] popViewControllerAnimated:NO];
}

- (void) showLoading {
    [spinner setHidden:NO];
}

- (void) hideLoading {
    [spinner setHidden:YES];
}

- (void) showToast:(NSString*)message {
    [self.view makeToast:message];
}

- (void) saveKey:(NSString*)key Value:(NSString*)value {
    [Common saveValueKey:key Value:value];
}

- (NSString*) getValueFromKey:(NSString*)key {
    return [Common getValueKey:key];
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
