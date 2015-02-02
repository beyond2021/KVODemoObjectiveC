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
    //Here we are setting values using keys. Also, we have seen and underlined what happens if a key name is mistyped.
    
   [self.child1 setValue:@"George" forKey:@"name"];//we set the desired values to both properties using the setValue:forKey
    

    
    [self.child1 setValue:[NSNumber numberWithInteger:15] forKey:@"age"];//we set the desired values to both properties using the setValue:forKey. Pay attention to the fact that the age is a number, therefore it cannot be passed directly as an argument to that method. Instead, we must convert it to a NSNumber object first. Besides that, watch that the key strings are the same to the properties’s names.
    
    //Here we are getting values using keys. Also, we have seen and underlined what happens if a key name is mistyped.
    NSString *childName = [self.child1 valueForKey:@"name"]; //we perform the exact opposite task. We extract the values out of the properties using the valueForKey: method, and we assign them to two local variable
    NSUInteger childAge = [[self.child1 valueForKey:@"age"]  integerValue]; //we perform the exact opposite task. We extract the values out of the properties using the valueForKey: method, and we assign them to two local variable. Focusing on the age again, notice that we want to get an unsigned integer value, so we convert the returned data type from NSNumber to NSInteger.
    

    
    NSLog(@"%@, %lu", childName, (unsigned long)childAge); //Finally, we display everything to the debugger. The output in this case is similar to the previous one
    // George, 15
    
    
/***************************************************************/
    
    self.child2 = [[Children alloc] init];// initialise the child2.
    [self.child2 setValue:@"Mary" forKey:@"name"];
    [self.child2 setValue:[NSNumber numberWithInteger:35] forKey:@"age"];
    
    
    self.child2.child = [[Children alloc] init]; // initialise child of a child. here we initialised Child2's child.
    /*
     The point now is how we can set values to the properties of the child object using the KVC style. According to what we said in the introduction of this tutorial, we must use the setValue:forKeyPath: method to do so. The key that we will provide is going to be a string with the dot syntax to point out the property of the object we want to change. In code:     */
    [self.child2 setValue:@"Andrew" forKeyPath:@"child.name"];
    [self.child2 setValue:[NSNumber numberWithInteger:5] forKeyPath:@"child.age"];
    //Check
    NSLog(@"%@, %lu", self.child2.child.name, (unsigned long)self.child2.child.age);
    
    
    //Perfect! Now, what if the child of the child has a child too? Let’s see this case too (the commands are given altogether):
    self.child3 = [[Children alloc] init];
    self.child3.child = [[Children alloc] init];
    self.child3.child.child = [[Children alloc] init];
    
    [self.child3 setValue:@"Tom" forKeyPath:@"child.child.name"];
    [self.child3 setValue:[NSNumber numberWithInteger:2] forKeyPath:@"child.child.age"];
    
    NSLog(@"%@, %lu", self.child3.child.child.name, (unsigned long)self.child3.child.child.age);
    
    
    
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.child1 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child1Context];
    [self.child1 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child1Context];
    
  // [self.child1 setValue:@"Keevin" forKey:@"name"];
    
    
   // [self.child1 willChangeValueForKey:@"name"];
   // self.child1.name = @"Keevin";
   // [self.child1 didChangeValueForKey:@"name"];
    
    
    [self.child1 setValue:[NSNumber numberWithInteger:100] forKey:@"age"];
    
    [self.child2 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child2Context];
    
    [self.child2 setValue:[NSNumber numberWithInteger:45] forKey:@"age"];
    
    self.child1.name = @"Michael";
    
    
    //The first step in KVO is to always observe for the desired property,
    [self.child1 addObserver:self forKeyPath:@"siblings" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    //Now, let’s add some objects to the array, and then remove one of them:
    [self.child1 insertObject:@"Alex" inSiblingsAtIndex:0];
    [self.child1 insertObject:@"Bob" inSiblingsAtIndex:1];
    [self.child1 insertObject:@"Mary" inSiblingsAtIndex:2];
    [self.child1 removeObjectFromSiblingsAtIndex:1];
    
    //Perfect! Not only we implemented the methods needed to make our array KVC compliant, we also used them to add and remove objects. There’s one step remaining, and that is to handle the received notification to the observeValueForKeyPath:object:change:context: method
 
    }


/*
 The parameters the above method accepts are:
 
 addObserver: This is the observing class, usually the self object.
 forKeyPath: I guess you can understand what’s this for. It is the string you used as a key or a key path and matches to the property you want to observe. Note that you specify here either a single key, or a key path.
 options: By setting a value other than 0 (zero) to this parameter, you specify what the notification should contain. You can set a single value, or a combination of NSKeyValueObservingOptions values, combining them using the logical or (|). In the above example, we ask from the notifications to contain both the old and the new value of the properties we observe.
 context: This is a pointer that can be used as a unique identifier for the change of the property we observe. Usually this is set to nil or NULL. We’ll see more about this later.
 
 Now that we have made our class able to observe for any changes in the above two properties, we must implement the observeValueForKeyPath:ofObject:change:context: method. Its implementation is mandatory, and it has one great disadvantage. That is the fact that is called for every KVO change, and if you observe many properties then you must write a lot of if statements so as to take the proper actions for each property. However, this can be easily overlooked as the benefits of the KVO are greater than this limitation.
 */



//Now that we have made our class able to observe for any changes in (viewWillAppear)the above two properties, we must implement the observeValueForKeyPath:ofObject:change:context: method

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    if (context == child1Context) {
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"The name of the FIRST child was changed.");
            NSLog(@"%@", change);
        }
        
        // to observe the age
        
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the FIRST child was changed.");
            NSLog(@"%@", change);
        }
    }
    // to observe the context
    else if (context == child2Context){
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the SECOND child was changed.");
            NSLog(@"%@", change);
        }
    }
    
    // to observe the array
    else{
        if ([keyPath isEqualToString:@"siblings"]) {
            NSLog(@"%@", change);
        }
    }
}

/*
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    //As you see, we do nothing special here (for the sake of the demonstration). What we only do, is to determine the property that was changed based on the keyPath parameter, and then to display just a single message along with the dictionary containing the changes that took place. In a real application, you apply all the needed logic to handle all the changes in each case.
    
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"The name of the child was changed.");
        NSLog(@"%@", change);
    }
    
    if ([keyPath isEqualToString:@"age"]) {
        NSLog(@"The age of the child was changed.");
        NSLog(@"%@", change);
    }
    
}
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
Lastly and before we reach at the end of this chapter, it’s also quite important at some point to remove the observers you add. There is not a recipe on where you should do that. For instance, in many cases it would be useful to do that in the observeValueForKeyPath:ofObject:change:context:, after you have handled a received notification. In other cases, you should do so upon the dismissal of a view controller. Generally, it’s up to your application’s structure the decision you will make about that. In this example, we will do it in the viewWillDissapear: method. Here it is:
 */

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.child1 removeObserver:self forKeyPath:@"name"];
    [self.child1 removeObserver:self forKeyPath:@"age"];
    [self.child2 removeObserver:self forKeyPath:@"age"];
}




@end
