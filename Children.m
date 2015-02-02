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
         self.siblings = [[NSMutableArray alloc] init];    }
    return self;
}


// let’s suppose that we don’t want a notification to be posted when the name property of the Children class get changed
+(BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    if ([key isEqualToString:@"name"]) {
        return NO;
    }
    else{
        return [super automaticallyNotifiesObserversForKey:key];
    }
}

-(void)setName:(NSString *)name{
    [self willChangeValueForKey:@"name"];
    _name = name;
    [self didChangeValueForKey:@"name"];
}

//Imp[lementing the array methods
-(NSUInteger)countOfSiblings{
    return self.siblings.count;
}


-(id)objectInSiblingsAtIndex:(NSUInteger)index{
    return [self.siblings objectAtIndex:index];
}


-(void)insertObject:(NSString *)object inSiblingsAtIndex:(NSUInteger)index{
    [self.siblings insertObject:object atIndex:index];
}


-(void)removeObjectFromSiblingsAtIndex:(NSUInteger)index{
    [self.siblings removeObjectAtIndex:index];
}
//That’s it! Now the siblings array is KVC compliant

@end
