//
//  KVCMutableArray.h
//  KVODemoObjectiveC
//
//  Created by KEEVIN MITCHELL on 2/2/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVCMutableArray : NSObject

@property (nonatomic, strong) NSMutableArray *array;

//KVC compliant methods for the array
-(NSUInteger)countOfArray;

-(id)objectInArrayAtIndex:(NSUInteger)index;

-(void)insertObject:(id)object inArrayAtIndex:(NSUInteger)index;

-(void)removeObjectFromArrayAtIndex:(NSUInteger)index;

-(void)replaceObjectInArrayAtIndex:(NSUInteger)index withObject:(id)object; //Notice that I added a new method, the replaceObjectInArrayAtIndex:withObject:, so our class is even more powerful.

@end
