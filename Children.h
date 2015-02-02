//
//  Children.h
//  KVODemoObjectiveC
//
//  Created by KEEVIN MITCHELL on 1/31/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//   the name and the age of a hypothetic person’s children

#import <Foundation/Foundation.h>
# import "KVCMutableArray.h"

@interface Children : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic) NSUInteger age;

@property (nonatomic, strong) Children *child; //With this, we can represent in code the child of a child (and so on)
@property (nonatomic, strong) NSMutableArray *siblings;


-(NSUInteger)countOfSiblings;

-(id)objectInSiblingsAtIndex:(NSUInteger)index;

-(void)insertObject:(NSString *)object inSiblingsAtIndex:(NSUInteger)index; // Xcode does not set the type of the objects to the parameters automatically, but it let’s you type them according to the kind of data you are going to have in your array. In other words, if you start typing it Xcode will suggest you this:


//-(void)insertObject:(<object-type> *)object inSiblingsAtIndex:(<NSUInteger>)index

-(void)removeObjectFromSiblingsAtIndex:(NSUInteger)index;

//Notice how the siblings array name is used in the above declarations, and that the first letter is always capital




//Let’s assume now that in the Children (This) class we want to add and observe a new array, which will contain the names of the cousins of a child. It’s obvious that instead of a normal mutable array, we will use an object of the KVCMutableArray class.
@property (nonatomic, strong) KVCMutableArray *cousins;


@end
