//
//  AppDelegate.m
//  Doha UPVC
//
//  Created by Star on 10/3/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "AppDelegate.h"

NSArray* gallery_windows;
NSArray* gallery_upvc_doors;
NSArray* gallery_wooden_doors;
NSArray* gallery_frameless_glass;
NSArray* gallery_handrail_glass;
NSArray* gallery_mirror_glass;
NSArray* gallery_shower_glass;
NSArray* gallery_tents;
NSArray* gallery_pvc;
NSArray* gallery_plastic;

Boolean isBack;
Boolean isReload;


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //[LanguageManager saveLanguageByCode:LANG_EN];
    
    isBack = false;
    isReload = false;
    
    gallery_windows = @[@"content_window1.jpg",
                       @"content_window2.jpg",
                       @"content_window3.jpg",
                       @"content_window4.jpg",
                       @"content_window5.jpg",
                       @"content_window6.jpg",
                       @"content_window7.jpg",
                       @"content_window8.jpg",
                       @"content_window9.jpg",
                       @"content_window10.jpg",
                       @"content_window11.jpg",
                       @"content_window12.jpg",
                       @"content_window13.jpg",
                       @"content_window14.jpg",
                       @"content_window15.jpg",
                       @"content_window16.jpg",
                       @"content_window17.jpg",
                       @"content_window18.jpg",
                       @"content_window19.jpg",
                       @"content_window20.jpg",
                       @"content_window21.jpg",
                       @"content_window22.jpg",
                       @"content_window23.jpg",
                       @"content_window24.jpg",
                       @"content_window25.jpg",
                       @"content_window26.jpg",
                       @"content_window27.jpg",
                       @"content_window28.jpg",
                       @"content_window29.jpg",
                       @"content_window30.jpg"];
    
    gallery_upvc_doors = @[@"content_doors1.jpg",
                           @"content_doors2.jpg",
                           @"content_doors3.jpg",
                           @"content_doors4.jpg",
                           @"content_doors5.jpg",
                           @"content_doors6.jpg",
                           @"content_doors7.jpg",
                           @"content_doors8.jpg",
                           @"content_doors9.jpg",
                           @"content_doors10.jpg",
                           @"content_doors12.jpg",
                           @"content_doors13.jpg",
                           @"content_doors14.jpg",
                           @"content_doors15.jpg",
                           @"content_doors16.jpg",
                           @"content_doors17.jpg"];
    
    gallery_wooden_doors = @[@"wooden_1p_1d_1c.png",
                             @"wooden_1p_1d_2c.png",
                             @"wooden_1p_1d_3c.png",
                             @"wooden_1p_1d_4c.png",
                             @"wooden_1p_1d_5c.png",
                             @"wooden_1p_1d_6c.png",
                             @"wooden_2p_1d_1c.png",
                             @"wooden_2p_1d_2c.png",
                             @"wooden_2p_1d_3c.png",
                             @"wooden_2p_1d_4c.png",
                             @"wooden_2p_1d_5c.png",
                             @"wooden_2p_1d_6c.png",
                             @"wooden_3p_1d_1c.png",
                             @"wooden_3p_1d_2c.png",
                             @"wooden_3p_1d_3c.png",
                             @"wooden_3p_1d_4c.png",
                             @"wooden_3p_1d_5c.png",
                             @"wooden_3p_1d_6c.png",
                             @"wooden_4p_1d_1c.png",
                             @"wooden_4p_1d_2c.png",
                             @"wooden_4p_1d_3c.png",
                             @"wooden_4p_1d_4c.png",
                             @"wooden_4p_1d_5c.png",
                             @"wooden_4p_1d_6c.png",
                             @"wooden_5p_1d_1c.png",
                             @"wooden_5p_1d_2c.png",
                             @"wooden_5p_1d_3c.png",
                             @"wooden_5p_1d_4c.png",
                             @"wooden_5p_1d_5c.png",
                             @"wooden_5p_1d_6c.png",
                             @"wooden_6p_1d_1c.png",
                             @"wooden_6p_1d_2c.png",
                             @"wooden_6p_1d_3c.png",
                             @"wooden_6p_1d_4c.png",
                             @"wooden_6p_1d_5c.png",
                             @"wooden_6p_1d_6c.png",
                             @"wooden_7p_1d_1c.png",
                             @"wooden_7p_1d_2c.png",
                             @"wooden_7p_1d_3c.png",
                             @"wooden_7p_1d_4c.png",
                             @"wooden_7p_1d_5c.png",
                             @"wooden_7p_1d_6c.png",];
    
    gallery_frameless_glass = @[@"content_fl1.jpg",
                                @"content_fl2.jpg",
                                @"content_fl3.jpg",
                                @"content_fl4.jpg",
                                @"content_fl5.jpg",
                                @"content_fl6.jpg",
                                @"content_fl7.jpg",
                                @"content_fl8.jpg",
                                @"content_fl9.jpg",
                                @"content_fl10.jpg",
                                @"content_fl11.jpg"];
    
    gallery_handrail_glass = @[@"content_handrial1.jpg",
                               @"content_handria2.jpg",
                               @"content_handria3.jpg",
                               @"content_handria4.jpg"];
    
    gallery_mirror_glass = @[@"content_mirrors1.jpg",
                             @"content_mirrors2.jpg",
                             @"content_mirrors3.jpg"];
    
    gallery_shower_glass = @[@"content_shower1.jpg",
                             @"content_shower2.jpg",
                             @"content_shower3.jpg",
                             @"content_shower4.jpg",
                             @"content_shower5.jpg",
                             @"content_shower6.jpg",
                             @"content_shower7.jpg",
                             @"content_shower8.jpg",
                             @"content_shower9.jpg",
                             @"content_shower10.jpg",
                             @"content_shower11.jpg",
                             @"content_shower12.jpg",
                             @"content_shower13.jpg",
                             @"content_shower14.jpg",
                             @"content_shower15.jpg",
                             @"content_shower16.jpg",
                             @"content_shower17.jpg",
                             @"content_shower18.jpg",
                             @"content_shower19.jpg",
                             @"content_shower20.jpg",
                             @"content_shower21.jpg",
                             @"content_shower22.jpg",
                             @"content_shower23.jpg",
                             @"content_shower24.jpg",
                             @"content_shower25.jpg",
                             @"content_shower26.jpg"
                             ];
    
    gallery_tents = @[@"content_tent-1.jpg",
                      @"content_tent-2.jpg",
                      @"content_tent-3.jpg",
                      @"content_tent-4.jpg"];
    
    gallery_pvc = @[@"content_kitchen1.jpg",
                    @"content_kitchen2.jpg",
                    @"content_kitchen3.jpg",
                    @"content_kitchen4.jpg"];
    
    gallery_plastic = @[@"content_pwg1.jpg",
                        @"content_pwg2.jpg",
                        @"content_pwg3.jpg",
                        @"content_pwg4.jpg",
                        @"content_pwg5.jpg",
                        @"content_pwg6.jpg",
                        @"content_pwg7.jpg",
                        @"content_pwg8.jpg",
                        @"content_pwg9.jpg",
                        @"content_pwg10.jpg"];
    
    
    /****************************************************
     *                    One Signal                    *
     ****************************************************/
    [OneSignal setLogLevel:ONE_S_LL_VERBOSE visualLevel:ONE_S_LL_WARN];
    
    id notificationRecievedBlock = ^(OSNotification *notification) {
        NSLog(@"Received Notification - %@", notification.notificationId);
        NSDictionary *dict = notification.additionalData;
        
    };
    
    // (Optional) - Create block that will fire when a notification is tapped on.
    id notificationOpenedBlock = ^(OSNotificationOpenedResult *result) {
        OSNotification* payload = result.notification;
        
        NSString* messageTitle = @"Doha UPVC";
        NSString* fullMessage = [payload.body copy];
        
        if (payload.additionalData) {
            
            if (payload.title)
                messageTitle = payload.title;
            
            if (result.action.actionId)
                fullMessage = [fullMessage stringByAppendingString:[NSString stringWithFormat:@"\nPressed ButtonId:%@", result.action.actionId]];
        }
        
        // parse notification data
        //data = payload.additionalData;
        
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:messageTitle
                                                            message:fullMessage
                                                           delegate:self
                                                  cancelButtonTitle:@"Close"
                                                  otherButtonTitles:nil, nil];
        alertView.tag = 2000;
        //[alertView show];
    };
    
    // (Optional) - Configuration options for OneSignal settings.
//    id oneSignalSetting = @{kOSSettingsKeyInFocusDisplayOption : @(OSNotificationDisplayTypeNotification), kOSSettingsKeyAutoPrompt : @YES};
    
    
    // (REQUIRED) - Initializes OneSignal
//    [OneSignal initWithLaunchOptions:launchOptions
//                               appId:@"1f732604-e233-4d3b-8411-b2379a53a35f"
//          handleNotificationReceived:notificationRecievedBlock
//            handleNotificationAction:notificationOpenedBlock
//                            settings:oneSignalSetting];
        [OneSignal initWithLaunchOptions:launchOptions];
        [OneSignal setAppId:@"1f732604-e233-4d3b-8411-b2379a53a35f"];
    
//    [OneSignal IdsAvailable:^(NSString* userId, NSString* pushToken) {
//        if (pushToken) {
//            //self.textMultiLine1.text = [NSString stringWithFormat:@"PlayerId:\n%@\n\nPushToken:\n%@\n", userId, pushToken];
//            NSLog(@"UserId-  %@, pushToken-  %@", userId, pushToken);
//            //oneID = userId;
//        } else {
//            //self.textMultiLine1.text = @"ERROR: Could not get a pushToken from Apple! Make sure your provisioning profile has 'Push Notifications' enabled and rebuild your app.";
//
//            NSLog(@"\n%@", @"ERROR: Could not get a pushToken from Apple! Make sure your provisioning profile has 'Push Notifications' enabled and rebuild your app.");
//        }
//    }];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
