//
//  HttpApi.h
//  Foods
//
//  Created by Jin_Q on 3/17/16.
//  Copyright © 2016 Jin_Q. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpApi : NSObject

+ (id)sharedInstance;

- (void)loginWithEmail:(NSString*)email
              Password:(NSString*)password
             Completed:(void(^)(NSDictionary*))completed
                Failed:(void (^)(NSString *))failed;

- (void)getNonceCompleted:(void(^)(NSDictionary*))completed
         Failed:(void (^)(NSString *))failed;

- (void)signupWithEmail:(NSString*)email
              Password:(NSString*)password
                  Nonce:(NSString*)nonce
             Completed:(void(^)(NSDictionary*))completed
                Failed:(void (^)(NSString *))failed;
- (void)resetPassword:(NSString*)email
            Completed:(void(^)(NSDictionary*))completed
               Failed:(void (^)(NSString *))failed;

- (void)updateUserMetaDataWithCookie:(NSString*)cookie
                      BillingCompany:(NSString*)restname
                      BillingAddress:(NSString*)address
                         BillingCity:(NSString*)city
                     BillingPostCode:(NSString*)code
                        BillingPhone:(NSString*)phone
                        BillingEmail:(NSString*)email
                                 Lat:(NSNumber*)lat
                                Lang:(NSNumber*)lang
                           Completed:(void(^)(NSDictionary*))completed
                              Failed:(void (^)(NSString *))failed;

- (void)getRestName:(NSString*)cookie
          Completed:(void(^)(NSDictionary*))completed
             Failed:(void (^)(NSString *))failed;

- (void)getCreditsWithEmail:(NSString*)email
                     Cookie:(NSString*)cookie
          Completed:(void(^)(NSDictionary*))completed
             Failed:(void (^)(NSString *))failed;

- (void)publishFoodWithUserId:(NSString*)userid
                     platseul:(NSString*)platseul
                         menu:(NSString*)menu
                       cemidi:(NSString*)cemidi
                       cesoir:(NSString*)cesoir
                  viandeRouge:(NSString*)viandeRouge
                viandeBlanche:(NSString*)viandeBlanche
                   vegetarien:(NSString*)vegetarien
                          bio:(NSString*)bio
                      poisson:(NSString*)poisson
                        halal:(NSString*)halal
                        vegan:(NSString*)vegan
                  description:(NSString*)description
                     addition:(NSString*)addition
                        price:(NSString*)price
                      Profile:(NSData*)photo
                    Completed:(void (^)(NSDictionary *))completed
                       Failed:(void (^)(NSString *))failed;

- (void)modifyFoodWithPId:(NSString*)pid
                   UserId:(NSString*)userid
                 platseul:(NSString*)platseul
                     menu:(NSString*)menu
                   cemidi:(NSString*)cemidi
                   cesoir:(NSString*)cesoir
              viandeRouge:(NSString*)viandeRouge
            viandeBlanche:(NSString*)viandeBlanche
               vegetarien:(NSString*)vegetarien
                      bio:(NSString*)bio
                  poisson:(NSString*)poisson
                    halal:(NSString*)halal
                    vegan:(NSString*)vegan
              description:(NSString*)description
                 addition:(NSString*)addition
                    price:(NSString*)price
                  Profile:(NSData*)photo
                Completed:(void (^)(NSDictionary *))completed
                   Failed:(void (^)(NSString *))failed;

- (void)getAllWithPage:(NSString*)page
                 limit:(NSString*)limit
             Completed:(void(^)(NSDictionary*))completed
                Failed:(void (^)(NSString *))failed;

- (void)searchWithPlatseul:(NSString*)platseul
                      menu:(NSString*)menu
                    cemidi:(NSString*)cemidi
                    cesoir:(NSString*)cesoir
               viandeRouge:(NSString*)viandeRouge
             viandeBlanche:(NSString*)viandeBlanche
                vegetarien:(NSString*)vegetarien
                       bio:(NSString*)bio
                   poisson:(NSString*)poisson
                     halal:(NSString*)halal
                     vegan:(NSString*)vegan
                   price10:(NSString*)price10
                   price15:(NSString*)price15
                   price20:(NSString*)price20
                      city:(NSString*)city
                      page:(NSString*)page
                     limit:(NSString*)limit
                 Completed:(void(^)(NSDictionary*))completed
                    Failed:(void (^)(NSString *))failed;

- (void)getFoodsWithId:(NSString*)userid
             Completed:(void(^)(NSDictionary*))completed
                Failed:(void (^)(NSString *))failed;



@end
