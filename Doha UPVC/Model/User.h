//
//  User.h
//  FrenchFood
//
//  Created by weiquan zhang on 11/22/16.
//  Copyright © 2016 weiquan zhang. All rights reserved.
//

#import "BaseModel.h"

@interface User : BaseModel

@property (nonatomic, strong) NSString* userid;
@property (nonatomic, strong) NSString* email;

- (id) initWithDictionary:(NSDictionary *)dictionary;
@end
