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
    self.child1.name = @"George";
    self.child1.age = 15;
    
    NSLog(@"%@, %lu", self.child1.name, (unsigned long)self.child1.age);
    
    //… then we w1
    
   // George, 15

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
