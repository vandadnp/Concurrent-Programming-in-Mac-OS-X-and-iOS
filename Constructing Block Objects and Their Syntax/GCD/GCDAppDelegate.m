//
//  GCDAppDelegate.m
//  GCD
//
//  Created by Vandad Nahavandipoor on 11-04-06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GCDAppDelegate.h"

@implementation GCDAppDelegate


@synthesize window=_window;

//- (NSInteger) subtract:(NSInteger)paramValue
//                  from:(NSInteger)paramFrom{
//  
//  return paramFrom - paramValue;
//  
//}

//NSInteger subtract(NSInteger paramValue, NSInteger paramFrom){
//  
//  return paramFrom - paramValue;
//  
//}

NSInteger (^subtract)(NSInteger, NSInteger) = 
  ^(NSInteger paramValue, NSInteger paramFrom){
  
  return paramValue - paramValue;
  
};


//NSString* intToString (NSUInteger paramInteger){
//  
//  return [NSString stringWithFormat:@"%lu", 
//          (unsigned long)paramInteger];
//  
//}

//void (^simpleBlock)(void) = ^{
//  /* Implement the block object here */
//};
//NSString* (^intToString)(NSUInteger) = ^(NSUInteger paramInteger){
//  NSString *result = [NSString stringWithFormat:@"%lu",
//                      (unsigned long)paramInteger];
//  return result;
//};
//
//- (void) callIntToString{
//  
//  NSString *string = intToString(10);
//  NSLog(@"string = %@", string);
//  
//}



typedef NSString* (^IntToStringConverter)(NSUInteger paramInteger);

NSString* (^intToString)(NSUInteger) = ^(NSUInteger paramInteger){
  NSString *result = [NSString stringWithFormat:@"%lu",
                      (unsigned long)paramInteger];
  
  return result;
};

- (NSString *) convertIntToString:(NSUInteger)paramInteger
                 usingBlockObject:(IntToStringConverter)paramBlockObject{
  
  return paramBlockObject(paramInteger);
  
}

//- (void) doTheConversion{
//  
//  NSString *result = [self convertIntToString:123
//                             usingBlockObject:intToString];
//  
//  NSLog(@"result = %@", result);
//  
//}

//- (void) doTheConversion{
//  
//  IntToStringConverter inlineConverter = ^(NSUInteger paramInteger){
//    NSString *result = [NSString stringWithFormat:@"%lu",
//                        (unsigned long)paramInteger];
//    return result;
//  };
//  
//  NSString *result = [self convertIntToString:123
//                             usingBlockObject:inlineConverter];
//  
//  NSLog(@"result = %@", result);
//  
//}

//- (void) doTheConversion{
//  
//  NSString *result = 
//  [self convertIntToString:123 
//          usingBlockObject:^NSString *(NSUInteger paramInteger) {
//            
//    NSString *result = [NSString stringWithFormat:@"%lu",
//                        (unsigned long)paramInteger];
//    return result;
//            
//  }];
//  
//  NSLog(@"result = %@", result);
//  
//}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
  // Override point for customization after application launch.
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  /*
   Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  /*
   Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  /*
   Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  /*
   Called when the application is about to terminate.
   Save data if appropriate.
   See also applicationDidEnterBackground:.
   */
}

- (void)dealloc
{
  [_window release];
  [super dealloc];
}

@end
