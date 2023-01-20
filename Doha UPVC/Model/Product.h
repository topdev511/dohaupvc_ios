//
//  Product.h
//  Doha UPVC
//
//  Created by Star on 10/4/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface Product : BaseModel

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* c1_product;
@property (nonatomic, strong) NSString* c2_product;
@property (nonatomic, strong) NSString* c3_product;
@property (nonatomic, strong) NSString* c4_product;

@property (nonatomic, strong) NSString* s100_product;
@property (nonatomic, strong) NSString* s200_product;
@property (nonatomic, strong) NSString* s300_product;

@end
