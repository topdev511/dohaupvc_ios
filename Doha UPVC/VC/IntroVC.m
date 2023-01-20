//
//  IntroVC.m
//  Doha UPVC
//
//  Created by Star on 10/3/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "IntroVC.h"
#import "HomeVC.h"
#import "AppDelegate.h"

extern Boolean isBack;
extern Boolean isReload;

@interface IntroVC ()

@end

@implementation IntroVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString* isShowed = [Common getValueKey:@"isShowed"];
    
    if(isShowed != nil) {
        if(!isBack) {
            HomeVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeVC"];
            [self.navigationController pushViewController:vc animated:isReload];
        }
    }
    
    [Common saveValueKey:@"isShowed" Value:@"showed"];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [Common hideNavigationBar:self];
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
- (IBAction)onEnglish:(id)sender {
    [LanguageManager saveLanguageByCode:LANG_EN];
    [LanguageManager setupCurrentLanguage];
    [self reloadRootViewController];
    
    /*
    HomeVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeVC"];
    [self.navigationController pushViewController:vc animated:YES];
     */
}


- (IBAction)onArabic:(id)sender {
    [LanguageManager saveLanguageByCode:LANG_AR];
    [LanguageManager setupCurrentLanguage];
    [self reloadRootViewController];
    
    /*
    HomeVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeVC"];
    [self.navigationController pushViewController:vc animated:YES];
     */
}

- (void)reloadRootViewController
{
    isBack = false;
    isReload = true;
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSString *storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    delegate.window.rootViewController = [storyboard instantiateInitialViewController];
}

@end
