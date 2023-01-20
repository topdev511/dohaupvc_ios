//
//  Config.h
//  Foods
//
//  Created by Jin_Q on 3/17/16.
//  Copyright © 2016 Jin_Q. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 120.0) blue:((b) / 50.0) alpha:1.0]
#define WHITE_COLOR  [UIColor colorWithRed:(1.0) green:(1.0) blue:(1.0) alpha:1.0]

//French Color
#define MAIN_COLOR  [UIColor colorWithRed:(246/255.0) green:(142/255.0) blue:(32/255.0) alpha:1.0]
#define CLICKED_COLOR  [UIColor colorWithRed:(220/255.0) green:(120/255.0) blue:(12/255.0) alpha:1.0]
#define GRAY_COLOR  [UIColor colorWithRed:(125/255.0) green:(125/255.0) blue:(125/255.0) alpha:1.0]
#define HIGHLIGHT_COLOR [UIColor colorWithRed:(5/255.0) green:(142/255.0) blue:(32/255.0) alpha:1.0]

//General Constant
#define CHECKED @"1"
#define UNCHECKED @"0"

/*  Server API Url Part*/
#define PURCHASE_URL @"http://platofjour.com/tarif"
#define HISTORY_URL @"http://platofjour.com/historique-de-publication"
#define COMPLETE_URL @"http://platofjour.com/mon-compte"
#define RESET_PASSWORD_URL @"http://platofjour.com/mon-compte/lost-password/"
#define SIGNUP_URL @"http://platofjour.com/register/"
#define TERMS_URL @"http://platofjour.com/cgucgv"

#define SERVER_URL @"http://platofjour.com/"

#define LOGIN @"api/user/generate_auth_cookie/"
#define GET_NONCE @"api/get_nonce/?controller=user&method=register"
#define SIGNUP @"api/user/register/"
#define RESET_PASSWORD @"api/user/retrieve_password/"
#define UPDATE_USER_META_DATA @"api/user/update_user_meta_vars/"
#define GET_META_DATA @"api/user/get_user_meta/"
#define PUBLISH_FOOD @"publication_mobile.php"

#define GET_PUB_FOOD_WITH_ID @"get_pub_mobile_with_id.php"
#define MODIFY_FOOD @"modify_mobile.php"

/*
Salwa Road Branch Coordinates- 25.239993, 51.457769
Al Wakra Branch Coordinates- 25.164122, 51.597436
Al Khor Branch Coordinates- 25.684755, 51.495788
Um Slal Branch Coordinates- 25.409177, 51.421956
*/

