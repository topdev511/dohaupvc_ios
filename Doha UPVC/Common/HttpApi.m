//
//  HttpApi.m
//  Foods
//
//  Created by Jin_Q on 3/17/16.
//  Copyright © 2016 Jin_Q. All rights reserved.
//
#import "HttpApi.h"
#import "AFHTTPSessionManager.h"
#import "Config.h"
#import "Common.h"

@implementation HttpApi

HttpApi *sharedObj = nil;
AFHTTPSessionManager *manager;

+(id) sharedInstance{
    
    if(!sharedObj)
    {
        static dispatch_once_t oncePredicate;
        dispatch_once(&oncePredicate, ^{
            sharedObj = [[self alloc] init] ;
            manager = [AFHTTPSessionManager manager];
            [manager.requestSerializer setTimeoutInterval:60];
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects: @"application/json", @"text/html", nil];
        });
    }
    
    return sharedObj;
}

- (void)loginWithEmail:(NSString*)email
              Password:(NSString*)password
             Completed:(void(^)(NSDictionary*))completed
                Failed:(void (^)(NSString *))failed
{
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER_URL, LOGIN];
    NSDictionary *dicParams = @{
                                @"email":email,
                                @"password":password,
                                @"insecure":@"cool"
                                };
    
    NSURL *URL = [NSURL URLWithString:url];
    
    [manager POST:URL.absoluteString parameters:dicParams headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dicResponse = (NSDictionary *)responseObject;
        NSString* status = dicResponse[@"status"];
        if([status isEqualToString:@"ok"]) {
            completed(dicResponse);
        } else if([status isEqualToString:@"error"]) {
            NSString* errormessage = dicResponse[@"error"];
            failed(errormessage);
        } else {
            failed(@"Network Error!");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        
        NSError *jsonError;
        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
        NSString* errorMessage = [errorDic valueForKey:@"error"];
        failed(errorMessage);
        NSLog(@"%@",errResponse);
    }];
    
//    [manager POST:URL.absoluteString parameters:dicParams progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        NSDictionary *dicResponse = (NSDictionary *)responseObject;
//        NSString* status = dicResponse[@"status"];
//        if([status isEqualToString:@"ok"]) {
//            completed(dicResponse);
//        } else if([status isEqualToString:@"error"]) {
//            NSString* errormessage = dicResponse[@"error"];
//            failed(errormessage);
//        } else {
//            failed(@"Network Error!");
//        }
//    } failure:^(NSURLSessionTask *operation, NSError *error) {
//        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
//
//        NSError *jsonError;
//        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
//
//        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
//                                                                 options:NSJSONReadingMutableContainers
//                                                                   error:&jsonError];
//        NSString* errorMessage = [errorDic valueForKey:@"error"];
//        failed(errorMessage);
//        NSLog(@"%@",errResponse);
//
//    }];
}

- (void)getNonceCompleted:(void(^)(NSDictionary*))completed
                Failed:(void (^)(NSString *))failed
{
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER_URL, GET_NONCE];
    NSDictionary *dicParams = @{};
    
    NSURL *URL = [NSURL URLWithString:url];
    
    [manager GET:URL.absoluteString parameters:dicParams headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dicResponse = (NSDictionary *)responseObject;
        NSString* status = dicResponse[@"status"];
        if([status isEqualToString:@"ok"]) {
            completed(dicResponse);
        } else if([status isEqualToString:@"error"]) {
            NSString* errormessage = dicResponse[@"error"];
            failed(errormessage);
        } else {
            failed(@"Network Error!");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        
        NSError *jsonError;
        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
        NSString* errorMessage = [errorDic valueForKey:@"error"];
        failed(errorMessage);
        NSLog(@"%@",errResponse);
        
    }];
    
//    [manager GET:URL.absoluteString parameters:dicParams progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        NSDictionary *dicResponse = (NSDictionary *)responseObject;
//        NSString* status = dicResponse[@"status"];
//        if([status isEqualToString:@"ok"]) {
//            completed(dicResponse);
//        } else if([status isEqualToString:@"error"]) {
//            NSString* errormessage = dicResponse[@"error"];
//            failed(errormessage);
//        } else {
//            failed(@"Network Error!");
//        }
//    } failure:^(NSURLSessionTask *operation, NSError *error) {
//        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
//
//        NSError *jsonError;
//        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
//
//        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
//                                                                 options:NSJSONReadingMutableContainers
//                                                                   error:&jsonError];
//        NSString* errorMessage = [errorDic valueForKey:@"error"];
//        failed(errorMessage);
//        NSLog(@"%@",errResponse);
//
//    }];
    
}

- (void)signupWithEmail:(NSString*)email
               Password:(NSString*)password
                  Nonce:(NSString*)nonce
              Completed:(void(^)(NSDictionary*))completed
                   Failed:(void (^)(NSString *))failed
{
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER_URL, SIGNUP];
    NSDictionary *dicParams = @{
                                @"nonce":nonce,
                                @"email":email,
                                @"username":email,
                                @"display_name":email,
                                @"user_pass":password,
                                @"insecure":@"cool"
                                };
    
    NSURL *URL = [NSURL URLWithString:url];
    
    [manager POST:URL.absoluteString parameters:dicParams headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dicResponse = (NSDictionary *)responseObject;
        NSString* status = dicResponse[@"status"];
        if([status isEqualToString:@"ok"]) {
            completed(dicResponse);
        } else if([status isEqualToString:@"error"]) {
            NSString* errormessage = dicResponse[@"error"];
            failed(errormessage);
        } else {
            failed(@"Network Error!");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        
        NSError *jsonError;
        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
        NSString* errorMessage = [errorDic valueForKey:@"error"];
        failed(errorMessage);
        NSLog(@"%@",errResponse);
    }];
    
//    [manager POST:URL.absoluteString parameters:dicParams progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        NSDictionary *dicResponse = (NSDictionary *)responseObject;
//        NSString* status = dicResponse[@"status"];
//        if([status isEqualToString:@"ok"]) {
//            completed(dicResponse);
//        } else if([status isEqualToString:@"error"]) {
//            NSString* errormessage = dicResponse[@"error"];
//            failed(errormessage);
//        } else {
//            failed(@"Network Error!");
//        }
//    } failure:^(NSURLSessionTask *operation, NSError *error) {
//        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
//
//        NSError *jsonError;
//        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
//
//        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
//                                                                 options:NSJSONReadingMutableContainers
//                                                                   error:&jsonError];
//        NSString* errorMessage = [errorDic valueForKey:@"error"];
//        failed(errorMessage);
//        NSLog(@"%@",errResponse);
//
//    }];
}

- (void)resetPassword:(NSString*)email
             Completed:(void(^)(NSDictionary*))completed
                Failed:(void (^)(NSString *))failed
{
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER_URL, RESET_PASSWORD];
    NSDictionary *dicParams = @{
                                @"user_login":email,                                
                                @"insecure":@"cool"
                                };
    
    NSURL *URL = [NSURL URLWithString:url];
    
    [manager POST:URL.absoluteString parameters:dicParams headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dicResponse = (NSDictionary *)responseObject;
        NSString* status = dicResponse[@"status"];
        if([status isEqualToString:@"ok"]) {
            completed(dicResponse);
        } else if([status isEqualToString:@"error"]) {
            NSString* errormessage = dicResponse[@"error"];
            failed(errormessage);
        } else {
            failed(@"Network Error!");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        
        NSError *jsonError;
        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
        NSString* errorMessage = [errorDic valueForKey:@"error"];
        failed(errorMessage);
        NSLog(@"%@",errResponse);
    }];
    
//    [manager POST:URL.absoluteString parameters:dicParams progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        NSDictionary *dicResponse = (NSDictionary *)responseObject;
//        NSString* status = dicResponse[@"status"];
//        if([status isEqualToString:@"ok"]) {
//            completed(dicResponse);
//        } else if([status isEqualToString:@"error"]) {
//            NSString* errormessage = dicResponse[@"error"];
//            failed(errormessage);
//        } else {
//            failed(@"Network Error!");
//        }
//    } failure:^(NSURLSessionTask *operation, NSError *error) {
//        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
//
//        NSError *jsonError;
//        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
//
//        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
//                                                                 options:NSJSONReadingMutableContainers
//                                                                   error:&jsonError];
//        NSString* errorMessage = [errorDic valueForKey:@"error"];
//        failed(errorMessage);
//        NSLog(@"%@",errResponse);
//
//    }];
}

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
                 Failed:(void (^)(NSString *))failed
{
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER_URL, UPDATE_USER_META_DATA];
    NSDictionary *dicParams = @{
                                @"cookie":cookie,
                                @"billing_company":restname,
                                @"billing_address_1":address,
                                @"billing_city":city,
                                @"billing_postcode":code,
                                @"billing_phone":phone,
                                @"billing_email":email,
                                @"nickname":email,
                                @"lati":lat,
                                @"long":lang,
                                @"insecure":@"cool"
                                };
    
    NSURL *URL = [NSURL URLWithString:url];
    
    [manager POST:URL.absoluteString parameters:dicParams headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dicResponse = (NSDictionary *)responseObject;
        NSString* status = dicResponse[@"status"];
        if([status isEqualToString:@"ok"]) {
            completed(dicResponse);
        } else if([status isEqualToString:@"error"]) {
            NSString* errormessage = dicResponse[@"error"];
            failed(errormessage);
        } else {
            failed(@"Network Error!");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        
        NSError *jsonError;
        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
        NSString* errorMessage = [errorDic valueForKey:@"error"];
        failed(errorMessage);
        NSLog(@"%@",errResponse);
    }];
    
//    [manager POST:URL.absoluteString parameters:dicParams progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        NSDictionary *dicResponse = (NSDictionary *)responseObject;
//        NSString* status = dicResponse[@"status"];
//        if([status isEqualToString:@"ok"]) {
//            completed(dicResponse);
//        } else if([status isEqualToString:@"error"]) {
//            NSString* errormessage = dicResponse[@"error"];
//            failed(errormessage);
//        } else {
//            failed(@"Network Error!");
//        }
//    } failure:^(NSURLSessionTask *operation, NSError *error) {
//        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
//
//        NSError *jsonError;
//        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
//
//        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
//                                                                 options:NSJSONReadingMutableContainers
//                                                                   error:&jsonError];
//        NSString* errorMessage = [errorDic valueForKey:@"error"];
//        failed(errorMessage);
//        NSLog(@"%@",errResponse);
//
//    }];
}

- (void)getRestName:(NSString*)cookie
              Completed:(void(^)(NSDictionary*))completed
                 Failed:(void (^)(NSString *))failed
{
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER_URL, GET_META_DATA];
    NSDictionary *dicParams = @{
                                @"cookie":cookie,
                                @"insecure":@"cool"
                                };
    
    NSURL *URL = [NSURL URLWithString:url];
    
    [manager POST:URL.absoluteString parameters:dicParams headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dicResponse = (NSDictionary *)responseObject;
        NSString* status = dicResponse[@"status"];
        if([status isEqualToString:@"ok"]) {
            completed(dicResponse);
        } else if([status isEqualToString:@"error"]) {
            NSString* errormessage = dicResponse[@"error"];
            failed(errormessage);
        } else {
            failed(@"Network Error!");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        
        NSError *jsonError;
        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
        NSString* errorMessage = [errorDic valueForKey:@"error"];
        failed(errorMessage);
        NSLog(@"%@",errResponse);
    }];
    
//    [manager POST:URL.absoluteString parameters:dicParams progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        NSDictionary *dicResponse = (NSDictionary *)responseObject;
//        NSString* status = dicResponse[@"status"];
//        if([status isEqualToString:@"ok"]) {
//            completed(dicResponse);
//        } else if([status isEqualToString:@"error"]) {
//            NSString* errormessage = dicResponse[@"error"];
//            failed(errormessage);
//        } else {
//            failed(@"Network Error!");
//        }
//    } failure:^(NSURLSessionTask *operation, NSError *error) {
//        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
//
//        NSError *jsonError;
//        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
//
//        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
//                                                                 options:NSJSONReadingMutableContainers
//                                                                   error:&jsonError];
//        NSString* errorMessage = [errorDic valueForKey:@"error"];
//        failed(errorMessage);
//        NSLog(@"%@",errResponse);
//
//    }];
}

- (void)getCreditsWithEmail:(NSString*)email
                     Cookie:(NSString*)cookie
                  Completed:(void(^)(NSDictionary*))completed
                     Failed:(void (^)(NSString *))failed
{
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER_URL, @"usercredit.php"];
    NSDictionary *dicParams = @{
                                @"email":email,
                                @"cookie":cookie,
                                @"insecure":@"cool"
                                };
    
    NSURL *URL = [NSURL URLWithString:url];
    
    [manager POST:URL.absoluteString parameters:dicParams headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dicResponse = (NSDictionary *)responseObject;
        NSString* status = dicResponse[@"status"];
        if([status isEqualToString:@"ok"]) {
            completed(dicResponse);
        } else if([status isEqualToString:@"error"]) {
            NSString* errormessage = dicResponse[@"error"];
            failed(errormessage);
        } else {
            failed(@"Network Error!");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        
        NSError *jsonError;
        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
        NSString* errorMessage = [errorDic valueForKey:@"error"];
        failed(errorMessage);
        NSLog(@"%@",errResponse);
        
    }];
    
//    [manager POST:URL.absoluteString parameters:dicParams progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        NSDictionary *dicResponse = (NSDictionary *)responseObject;
//        NSString* status = dicResponse[@"status"];
//        if([status isEqualToString:@"ok"]) {
//            completed(dicResponse);
//        } else if([status isEqualToString:@"error"]) {
//            NSString* errormessage = dicResponse[@"error"];
//            failed(errormessage);
//        } else {
//            failed(@"Network Error!");
//        }
//    } failure:^(NSURLSessionTask *operation, NSError *error) {
//        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
//
//        NSError *jsonError;
//        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
//
//        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
//                                                                 options:NSJSONReadingMutableContainers
//                                                                   error:&jsonError];
//        NSString* errorMessage = [errorDic valueForKey:@"error"];
//        failed(errorMessage);
//        NSLog(@"%@",errResponse);
//
//    }];
}

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
                        Failed:(void (^)(NSString *))failed
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@", SERVER_URL, PUBLISH_FOOD];
    NSMutableDictionary *dicParams = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                       @"user_id":userid,
                                                                                       @"platseul":platseul,
                                                                                       @"menu":menu,
                                                                                       @"cesoir":cesoir,
                                                                                       @"cemidi":cemidi,
                                                                                       @"viandeRouge":viandeRouge,
                                                                                       @"viandeBlanche":viandeBlanche,
                                                                                       @"vegetarien":vegetarien,
                                                                                       @"bio":bio,
                                                                                       @"poisson":poisson,
                                                                                       @"halal":halal,
                                                                                       @"vegan":vegan,
                                                                                       @"description":description,
                                                                                       @"addition":addition,
                                                                                       @"price":price
                                                                                       }];
    
    [manager POST:urlStr parameters:dicParams headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:[NSData dataWithData:photo]
                                    name:@"file"
                                fileName:@"image.jpg"
                                mimeType:@"image/jpg"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dicResponse = (NSDictionary *)responseObject;
        NSString* status = dicResponse[@"status"];
        if([status isEqualToString:@"success"]) {
            completed(dicResponse);
        } else if([status isEqualToString:@"error"]) {
            NSString* errormessage = dicResponse[@"message"];
            failed(errormessage);
        } else {
            failed(@"Network Error!");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        
        NSError *jsonError;
        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
        NSString* errorMessage = [errorDic valueForKey:@"error"];
        failed(errorMessage);
        NSLog(@"%@",errResponse);

    }];
    
//    [manager POST:urlStr
//       parameters:dicParams
//constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//    [formData appendPartWithFileData:[NSData dataWithData:photo]
//                                name:@"file"
//                            fileName:@"image.jpg"
//                            mimeType:@"image/jpg"];
//}
//         progress:nil success:^(NSURLSessionTask *operation, id responseObject) {
//             NSLog(@"JSON: %@", responseObject);
//             NSDictionary *dicResponse = (NSDictionary *)responseObject;
//             NSString* status = dicResponse[@"status"];
//             if([status isEqualToString:@"success"]) {
//                 completed(dicResponse);
//             } else if([status isEqualToString:@"error"]) {
//                 NSString* errormessage = dicResponse[@"message"];
//                 failed(errormessage);
//             } else {
//                 failed(@"Network Error!");
//             }
//         } failure:^(NSURLSessionTask *operation, NSError *error) {
//             NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
//
//             NSError *jsonError;
//             NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
//
//             NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
//                                                                      options:NSJSONReadingMutableContainers
//                                                                        error:&jsonError];
//             NSString* errorMessage = [errorDic valueForKey:@"error"];
//             failed(errorMessage);
//             NSLog(@"%@",errResponse);
//
//         }];
}

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
                   Failed:(void (^)(NSString *))failed
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@", SERVER_URL, MODIFY_FOOD];
    NSMutableDictionary *dicParams = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                       @"pid":pid,
                                                                                       @"user_id":userid,
                                                                                       @"platseul":platseul,
                                                                                       @"menu":menu,
                                                                                       @"cesoir":cesoir,
                                                                                       @"cemidi":cemidi,
                                                                                       @"viandeRouge":viandeRouge,
                                                                                       @"viandeBlanche":viandeBlanche,
                                                                                       @"vegetarien":vegetarien,
                                                                                       @"bio":bio,
                                                                                       @"poisson":poisson,
                                                                                       @"halal":halal,
                                                                                       @"vegan":vegan,
                                                                                       @"description":description,
                                                                                       @"addition":addition,
                                                                                       @"price":price
                                                                                       }];
    
    [manager POST:urlStr parameters:dicParams headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:[NSData dataWithData:photo]
                                    name:@"file"
                                fileName:@"image.jpg"
                                mimeType:@"image/jpg"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dicResponse = (NSDictionary *)responseObject;
        NSString* status = dicResponse[@"status"];
        if([status isEqualToString:@"success"]) {
            completed(dicResponse);
        } else if([status isEqualToString:@"error"]) {
            NSString* errormessage = dicResponse[@"message"];
            failed(errormessage);
        } else {
            failed(@"Network Error!");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        
        NSError *jsonError;
        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
        NSString* errorMessage = [errorDic valueForKey:@"error"];
        failed(errorMessage);
        NSLog(@"%@",errResponse);
        
    }];
    
//    [manager POST:urlStr
//       parameters:dicParams
//constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//    [formData appendPartWithFileData:[NSData dataWithData:photo]
//                                name:@"file"
//                            fileName:@"image.jpg"
//                            mimeType:@"image/jpg"];
//}
//         progress:nil success:^(NSURLSessionTask *operation, id responseObject) {
//             NSLog(@"JSON: %@", responseObject);
//             NSDictionary *dicResponse = (NSDictionary *)responseObject;
//             NSString* status = dicResponse[@"status"];
//             if([status isEqualToString:@"success"]) {
//                 completed(dicResponse);
//             } else if([status isEqualToString:@"error"]) {
//                 NSString* errormessage = dicResponse[@"message"];
//                 failed(errormessage);
//             } else {
//                 failed(@"Network Error!");
//             }
//         } failure:^(NSURLSessionTask *operation, NSError *error) {
//             NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
//
//             NSError *jsonError;
//             NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
//
//             NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
//                                                                      options:NSJSONReadingMutableContainers
//                                                                        error:&jsonError];
//             NSString* errorMessage = [errorDic valueForKey:@"error"];
//             failed(errorMessage);
//             NSLog(@"%@",errResponse);
//
//         }];
}

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
                    Failed:(void (^)(NSString *))failed
{
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER_URL, @"search_mobile.php"];
    NSDictionary *dicParams = @{
                                @"platseul":platseul,
                                @"menu":menu,
                                @"cesoir":cesoir,
                                @"viandeRouge":viandeRouge,
                                @"viandeBlanche":viandeBlanche,
                                @"vegetarien":vegetarien,
                                @"bio":bio,
                                @"poisson":poisson,
                                @"halal":halal,
                                @"vegan":vegan,
                                @"price10":price10,
                                @"price15":price15,
                                @"price20":price20,
                                @"city":city,
                                @"page":page,
                                @"limit":limit
                                };
    
    NSURL *URL = [NSURL URLWithString:url];
    
    [manager POST:URL.absoluteString parameters:dicParams headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dicResponse = (NSDictionary *)responseObject;
        NSString* status = dicResponse[@"status"];
        if([status isEqualToString:@"success"]) {
            completed(dicResponse);
        } else if([status isEqualToString:@"error"]) {
            NSString* errormessage = dicResponse[@"message"];
            failed(errormessage);
        } else {
            failed(@"Network Error!");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        
        NSError *jsonError;
        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
        NSString* errorMessage = [errorDic valueForKey:@"error"];
        failed(errorMessage);
        NSLog(@"%@",errResponse);
        
    }];
    
//    [manager POST:URL.absoluteString parameters:dicParams progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        NSDictionary *dicResponse = (NSDictionary *)responseObject;
//        NSString* status = dicResponse[@"status"];
//        if([status isEqualToString:@"success"]) {
//            completed(dicResponse);
//        } else if([status isEqualToString:@"error"]) {
//            NSString* errormessage = dicResponse[@"message"];
//            failed(errormessage);
//        } else {
//            failed(@"Network Error!");
//        }
//    } failure:^(NSURLSessionTask *operation, NSError *error) {
//        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
//
//        NSError *jsonError;
//        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
//
//        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
//                                                                 options:NSJSONReadingMutableContainers
//                                                                   error:&jsonError];
//        NSString* errorMessage = [errorDic valueForKey:@"error"];
//        failed(errorMessage);
//        NSLog(@"%@",errResponse);
//
//    }];
}


- (void)getAllWithPage:(NSString*)page
          limit:(NSString*)limit
      Completed:(void(^)(NSDictionary*))completed
         Failed:(void (^)(NSString *))failed
{
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER_URL, @"get_all_mobile.php"];
    NSDictionary *dicParams = @{
                                @"page":page,
                                @"limit":limit
                                };
    
    NSURL *URL = [NSURL URLWithString:url];
    
    [manager GET:URL.absoluteString parameters:dicParams headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dicResponse = (NSDictionary *)responseObject;
        NSString* status = dicResponse[@"status"];
        if([status isEqualToString:@"success"]) {
            completed(dicResponse);
        } else if([status isEqualToString:@"error"]) {
            NSString* errormessage = dicResponse[@"message"];
            failed(errormessage);
        } else {
            failed(@"Network Error!");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        
        NSError *jsonError;
        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
        NSString* errorMessage = [errorDic valueForKey:@"error"];
        failed(errorMessage);
        NSLog(@"%@",errResponse);
        
    }];
    
//    [manager GET:URL.absoluteString parameters:dicParams progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        NSDictionary *dicResponse = (NSDictionary *)responseObject;
//        NSString* status = dicResponse[@"status"];
//        if([status isEqualToString:@"success"]) {
//            completed(dicResponse);
//        } else if([status isEqualToString:@"error"]) {
//            NSString* errormessage = dicResponse[@"message"];
//            failed(errormessage);
//        } else {
//            failed(@"Network Error!");
//        }
//    } failure:^(NSURLSessionTask *operation, NSError *error) {
//        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
//
//        NSError *jsonError;
//        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
//
//        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
//                                                                 options:NSJSONReadingMutableContainers
//                                                                   error:&jsonError];
//        NSString* errorMessage = [errorDic valueForKey:@"error"];
//        failed(errorMessage);
//        NSLog(@"%@",errResponse);
//
//    }];
}

- (void)getFoodsWithId:(NSString*)userid
             Completed:(void(^)(NSDictionary*))completed
                Failed:(void (^)(NSString *))failed
{
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER_URL, @"get_pub_mobile_with_id.php"];
    NSDictionary *dicParams = @{
                                @"userid":userid
                                };
    
    NSURL *URL = [NSURL URLWithString:url];
    
    [manager POST:URL.absoluteString parameters:dicParams headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dicResponse = (NSDictionary *)responseObject;
        NSString* status = dicResponse[@"status"];
        if([status isEqualToString:@"success"]) {
            completed(dicResponse);
        } else if([status isEqualToString:@"error"]) {
            NSString* errormessage = dicResponse[@"message"];
            failed(errormessage);
        } else {
            failed(@"Network Error!");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        
        NSError *jsonError;
        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
        NSString* errorMessage = [errorDic valueForKey:@"error"];
        failed(errorMessage);
        NSLog(@"%@",errResponse);
        
    }];
    
//    [manager POST:URL.absoluteString parameters:dicParams progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        NSDictionary *dicResponse = (NSDictionary *)responseObject;
//        NSString* status = dicResponse[@"status"];
//        if([status isEqualToString:@"success"]) {
//            completed(dicResponse);
//        } else if([status isEqualToString:@"error"]) {
//            NSString* errormessage = dicResponse[@"message"];
//            failed(errormessage);
//        } else {
//            failed(@"Network Error!");
//        }
//    } failure:^(NSURLSessionTask *operation, NSError *error) {
//        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
//
//        NSError *jsonError;
//        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
//
//        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
//                                                                 options:NSJSONReadingMutableContainers
//                                                                   error:&jsonError];
//        NSString* errorMessage = [errorDic valueForKey:@"error"];
//        failed(errorMessage);
//        NSLog(@"%@",errResponse);
//
//    }];
}

/* Post example */
/*
- (void)registerWithUsername:(NSString *)username
                    Password:(NSString *)password
                       Email:(NSString *)email
                      Apikey:(NSString *)apikey
                   Completed:(void (^)(NSString *))completed
                      Failed:(void (^)(NSString *))failed
{
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER_URL, SIGNUP];
    NSDictionary *dicParams = @{
                                @"username":username,
                                @"password":password,
                                @"email":email,
                                @"apiKey":apikey
                                };
    
    NSURL *URL = [NSURL URLWithString:url];
    [manager POST:URL.absoluteString parameters:dicParams progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dicResponse = (NSDictionary *)responseObject;
        NSString* token = [dicResponse objectForKey:@"token"];
        
        if([token isEqual:nil]){
            NSString *strErrorMsg = [dicResponse objectForKey:@"error"];
            failed(strErrorMsg);
        } else {
            completed(token);
        }
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSDictionary* dicResponse = (NSDictionary *)operation;
        NSDictionary* responseObject = [dicResponse valueForKey:@"responseObject"];
        //NSString* errorObject = [responseObject valueForKey:@"error"];
        NSDictionary* _userInfo = error.userInfo;
        NSString* errorMessage = [_userInfo valueForKey:@"NSLocalizedDescription"];        
        
        if([errorMessage isEqualToString:@"International roaming is curretly off"]) {
            failed(errorMessage);
        } else {
            if([responseObject valueForKey:@"message"] != nil){
                failed([responseObject valueForKey:@"message"]);
            } else {
                NSLog(@"Error: %@", error);
                failed(@"Network error!");
            }
        }
        
    }];
    
}
*/

/* Delete example */
/*
- (void)logoutWithToken:(NSString*)token
              Completed:(void (^)(NSDictionary *))completed
                 Failed:(void (^)(NSString *))failed
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@?token=%@", SERVER_URL, LOGOUT, token];
    NSDictionary *parameters = @{ @"token":token
                                  };
    
    NSURL *URL = [NSURL URLWithString:urlStr];
    [manager DELETE:URL.absoluteString parameters:parameters success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dicResponse = (NSDictionary *)responseObject;
        completed(dicResponse);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSDictionary* dicResponse = (NSDictionary *)operation;
        NSDictionary* responseObject = [dicResponse valueForKey:@"responseObject"];
        
        if([responseObject valueForKey:@"message"] != nil){
            failed([responseObject valueForKey:@"message"]);
        } else {
            NSLog(@"Error: %@", error);
            failed(@"Network error!");
        }
    }];
}
 */

/* Get Example */
/*
- (void)getExplorerTracksWithToken:(NSString*)token
                    Limit:(NSNumber*)limit
                     Page:(NSNumber*)page
                Completed:(void (^)(NSDictionary *))completed
                   Failed:(void (^)(NSString *))failed
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@?token=%@&limit=%@&page=%@", SERVER_URL, GET_EXPLORER_TRACKS, token, limit, page];
    NSDictionary *parameters = @{@"token":token,
                                 @"limit":limit,
                                 @"page":page
                                 };
    NSURL *URL = [NSURL URLWithString:urlStr];
    [manager GET:URL.absoluteString parameters:parameters  progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dicResponse = (NSDictionary *)responseObject;
        completed(dicResponse);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        failed(@"Network error!");
    }];
}

 */

/* Error process */
/*
- (void)getUserLikesWithToken:(NSString*)token
                      Limit:(NSNumber*)limit
                       Page:(NSNumber*)page
                     UserId:(NSString*)userid
                  Completed:(void (^)(NSDictionary *))completed
                     Failed:(void (^)(NSString *))failed
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@/%@/tracks/liked?token=%@&limit=%@&page=%@", SERVER_URL, USER, userid, token, limit, page];
    NSDictionary *parameters = @{
                                 @"token":token,
                                 @"limit":limit,
                                 @"page":page,
                                 @"userId":userid
                                 };
    NSURL *URL = [NSURL URLWithString:urlStr];
    [manager GET:URL.absoluteString parameters:parameters  progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dicResponse = (NSDictionary *)responseObject;
        completed(dicResponse);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        
        NSError *jsonError;
        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
        NSString* errorMessage = [errorDic valueForKey:@"message"];
        
        if([errorMessage isEqualToString:@"track_could_not_be_retrieved"]) {
            failed(@"Track could not be retrieved.");
        } else {
            NSLog(@"Error: %@", error);
            failed(errResponse);
        }
        NSLog(@"%@",errResponse);
    }];
}
*/

/* Image upload Example */
/*
- (void)setProfilePictureToken:(NSString*)token
                       Profile:(NSData*)photo
            Completed:(void (^)(NSDictionary *))completed
               Failed:(void (^)(NSString *))failed
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@?token=%@", SERVER_URL, SETTINGS_PHOTO, token];
    NSMutableDictionary *dicParams = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                       @"token":token
                                                                                       }];
    
    [manager POST:urlStr
       parameters:dicParams
constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    [formData appendPartWithFileData:[NSData dataWithData:photo]
                                name:@"profile"
                            fileName:@"image.jpg"
                            mimeType:@"image/jpg"];
}
          progress:nil success:^(NSURLSessionTask *operation, id responseObject) {
              NSLog(@"JSON: %@", responseObject);
              completed(responseObject);
          } failure:^(NSURLSessionTask *operation, NSError *error) {
              failed(@"Network Error!");
          }];
}
*/

/* Audio and Image upload example */
/*
- (void)uploadTrackWithToken:(NSString*)token
                       Title:(NSString*)title
                 Description:(NSString*)desc
                        Name:(NSString*)name
                         Tag:(NSString*)tag
                     BuyLink:(NSString*)buyLink
                 RecordLabel:(NSString*)recordLabel
                     License:(NSString*)license
                  Visibility:(NSString*)visibility
                       Embed:(NSString*)embed
                       Image:(NSData*)image
                       Track:(NSData*)track
                  Completed:(void (^)(NSDictionary *))completed
                     Failed:(void (^)(NSString *))failed
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@?token=%@", SERVER_URL, MY_TRACKS, token];
    NSDictionary *parameters = @{
                                 @"token":token,
                                 @"title":title,
                                 @"description":desc,
                                 @"name":name,
                                 @"tag":tag,
                                 @"buyLink":buyLink,
                                 @"recordLabel":recordLabel,
                                 @"license":license,
                                 @"visibility":visibility,
                                 @"embed":embed
                                 };
    
    [manager POST:urlStr
       parameters:parameters
constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    [formData appendPartWithFileData:[NSData dataWithData:image]
                                name:@"image"
                            fileName:@"image.jpg"
                            mimeType:@"image/jpg"];
    
    [formData appendPartWithFileData:[NSData dataWithData:track]
                                name:@"track"
                            fileName:@"track.mp3"
                            mimeType:@"audio/mpeg"];
}
        progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        completed(responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        //failed(@"Network error!");
        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        
        NSError *jsonError;
        NSData *objectData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* errorDic = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
        NSString* e_message = [errorDic valueForKey:@"message"];
        NSString* e_label = [errorDic valueForKey:@"label"];
        NSString* e_title = [errorDic valueForKey:@"title"];
        NSString* e_album = [errorDic valueForKey:@"album"];
        
        if([e_message isEqualToString:@"copyrighted_track"]) {
            failed(@"This track is not yours, please upload your track.");
        } else {
            NSLog(@"Error: %@", error);
            failed(errResponse);
        }
        NSLog(@"%@",errResponse);
    }];
}
*/






























@end
