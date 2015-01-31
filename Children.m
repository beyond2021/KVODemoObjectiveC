//
//  Children.m
//  KVODemoObjectiveC
//
//  Created by KEEVIN MITCHELL on 1/31/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

#import "Children.h"

@implementation Children

//initialise the two properties
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"";
        self.age = 0;
    }
    return self;
}
@end
