//
//  ViewController.m
//  KVODemoObjectiveC
//
//  Created by KEEVIN MITCHELL on 1/30/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

#import "ViewController.h"
#import "Children.h" // KVC at work

@interface ViewController ()
//declare three objects of the Children class to the private class section.
@property (nonatomic, strong) Children *child1;

@property (nonatomic, strong) Children *child2;

@property (nonatomic, strong) Children *child3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.child1 = [[Children alloc] init]; // initialise the first object.
    
    
    //If we assign values to the name and age properties of the child1 object, and then show them on the debugger
    
    /*
    self.child1.name = @"George";
    self.child1.age = 15;
    
    NSLog(@"%@, %lu", self.child1.name, (unsigned long)self.child1.age);
     */
    
    //… then we w1
    
   // George, 15
    
    
    //Using KVC
    
    [self.child1 setValue:@"George" forKey:@"name"];//we set the desired values to both properties using the setValue:forKey
    
    [self.child1 setValue:[NSNumber numberWithInteger:15] forKey:@"age"];//we set the desired values to both properties using the setValue:forKey. Pay attention to the fact that the age is a number, therefore it cannot be passed directly as an argument to that method. Instead, we must convert it to a NSNumber object first. Besides that, watch that the key strings are the same to the properties’s names.
    
    NSString *childName = [self.child1 valueForKey:@"name"]; //we perform the exact opposite task. We extract the values out of the properties using the valueForKey: method, and we assign them to two local variable
    NSUInteger childAge = [[self.child1 valueForKey:@"age"]  integerValue]; //we perform the exact opposite task. We extract the values out of the properties using the valueForKey: method, and we assign them to two local variable. Focusing on the age again, notice that we want to get an unsigned integer value, so we convert the returned data type from NSNumber to NSInteger.
    

    
    NSLog(@"%@, %lu", childName, (unsigned long)childAge); //Finally, we display everything to the debugger. The output in this case is similar to the previous one
    // George, 15
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
