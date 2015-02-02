//
//  KVCMutableArray.m
//  KVODemoObjectiveC
//
//  Created by KEEVIN MITCHELL on 2/2/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

#import "KVCMutableArray.h"

@implementation KVCMutableArray

//Now, let’s create an init method, where we will initialize the array
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.array = [[NSMutableArray alloc] init];
    }
    return self;
}
//This array is going to be the container for all of our data, so its role is very important. Now we have it declared and initialized, we can move to the methods that will make it KVC compliant. Firstly, go to the KVCMutableArray.h file and do the proper declarations:



-(NSUInteger)countOfArray{
    return self.array.count;
}


-(id)objectInArrayAtIndex:(NSUInteger)index{
    return [self.array objectAtIndex:index];
}


-(void)insertObject:(id)object inArrayAtIndex:(NSUInteger)index{
    [self.array insertObject:object atIndex:index];
}


-(void)removeObjectFromArrayAtIndex:(NSUInteger)index{
    [self.array removeObjectAtIndex:index];
}

-(void)replaceObjectInArrayAtIndex:(NSUInteger)index withObject:(id)object{
    [self.array replaceObjectAtIndex:index withObject:object];
}



@end
