//
//  User.m
//  FrenchFood
//
//  Created by weiquan zhang on 11/22/16.
//  Copyright © 2016 weiquan zhang. All rights reserved.
//

#import "User.h"

@implementation User
- (id) initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];
    self.userid = [dictionary objectForKey:@"id"];
    return self;
}
@end
