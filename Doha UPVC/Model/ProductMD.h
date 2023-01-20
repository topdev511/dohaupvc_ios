//
//  ProductMD.h
//  Doha UPVC
//
//  Created by Star on 11/16/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductMD : NSObject

@property (nonatomic, strong) NSString* design;
@property (nonatomic, strong) NSString* title;
@property (nonatomic) int width_from;
@property (nonatomic) int width_to;
@property (nonatomic) int height_from;
@property (nonatomic) int height_to;
@property (nonatomic) int open_height_from;
@property (nonatomic) int open_height_to;
@property (nonatomic) BOOL isRect;
@property (nonatomic) int designId;
@property (nonatomic) int productId;
@property (nonatomic, strong) NSString* modelCode;

@end
