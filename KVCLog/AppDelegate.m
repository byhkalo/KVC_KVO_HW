//
//  AppDelegate.m
//  KVCLog
//
//  Created by Konstantyn Bykhkalo on 21.01.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import "AppDelegate.h"
#import "BKStudent.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSArray* studentsArray;
@property (strong, nonatomic) BKStudent* myStudent;
@property (strong, nonatomic) NSString* key;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    BKStudent* student1 = [BKStudent randomStudent];
    BKStudent* student2 = [BKStudent randomStudent];
    BKStudent* student3 = [BKStudent randomStudent];
    BKStudent* student4 = [BKStudent randomStudent];
    BKStudent* student5 = [BKStudent randomStudent];
    
    self.myStudent = student1;
    
    self.key = @"firstName";
    [self addObserverToSelfStudentOnKey:self.key];
    
    student1.friend = student2;
    student2.friend = student3;
    student3.friend = student4;
    student4.friend = student5;
    student5.friend = student1;
    
    self.studentsArray = [NSArray arrayWithObjects:student1,student2,student3,student4,student5, nil];
    
    NSLog(@"%@", self.studentsArray);
    
    //NSLog(@"%@", [student2 valueForKeyPath:@"student2.friend.firstName"]);
    
    NSLog(@"student - %@, has friend - %@",[student2 valueForKeyPath:@"firstName"], [student2 valueForKeyPath:@"friend.firstName"]);
    NSLog(@"student - %@, has friend - %@",[student2 valueForKeyPath:@"friend.firstName"], [student2 valueForKeyPath:@"friend.friend.firstName"]);
    NSLog(@"student - %@, has friend - %@",[student2 valueForKeyPath:@"friend.friend.firstName"], [student2 valueForKeyPath:@"friend.friend.friend.firstName"]);
    NSLog(@"student - %@, has friend - %@",[student2 valueForKeyPath:@"friend.friend.friend.firstName"], [student2 valueForKeyPath:@"friend.friend.friend.friend.firstName"]);
    NSLog(@"student - %@, has friend - %@",[student2 valueForKeyPath:@"friend.friend.friend.friend.firstName"], [student2 valueForKeyPath:@"friend.friend.friend.friend.friend.firstName"]);
    NSLog(@"student - %@, has friend - %@",[student2 valueForKeyPath:@"friend.friend.friend.friend.friend.firstName"], [student2 valueForKeyPath:@"friend.friend.friend.friend.friend.friend.firstName"]);
    
    NSArray * namesArray = [self valueForKeyPath:@"studentsArray.@unionOfObjects.firstName"];
    
    NSLog(@"%@", namesArray);
    
    NSDate* minDate = [self.studentsArray valueForKeyPath:@"@min.dateOfBirth"];
    NSDate* maxDate = [self.studentsArray valueForKeyPath:@"@max.dateOfBirth"];
    NSNumber* sumOfMarks = [self.studentsArray valueForKeyPath:@"@sum.mark"];
    NSNumber* averageMark = [self.studentsArray valueForKeyPath:@"@avg.mark"];
    
    NSLog(@"\nminDate = %@ \nmaxDate = %@ \nsumOfMarks = %d \naveraheMark = %1.2f", minDate, maxDate,[sumOfMarks integerValue], [averageMark floatValue]);
    
    [self.myStudent setValue:@"Robbert Danny" forKeyPath:self.key];
    
    
    return YES;
}

-(void) addObserverToSelfStudentOnKey: (NSString*) key {
    
    [self.myStudent addObserver:self forKeyPath:key options:NSKeyValueObservingOptionNew context:nil];
    
}

-(void) dealloc {
    
    [self.myStudent removeObserver:self forKeyPath:self.key];
    
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    id someObject = [change objectForKey:NSKeyValueChangeNewKey];
    
    NSLog(@"newChange = %@", (NSString*)someObject);
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
