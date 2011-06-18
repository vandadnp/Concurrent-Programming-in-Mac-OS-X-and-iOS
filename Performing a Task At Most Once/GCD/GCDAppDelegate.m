//
//  GCDAppDelegate.m
//  GCD
//
//  Created by Vandad Nahavandipoor on 11-04-06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GCDAppDelegate.h"
#import "MySingleton.h"

@implementation GCDAppDelegate
@synthesize window=_window;

//static dispatch_once_t onceToken;
//
//void (^executedOnlyOnce)(void) = ^{
//  
//  static NSUInteger numberOfEntries = 0;
//  numberOfEntries++;
//  NSLog(@"Executed %lu time(s)", (unsigned long)numberOfEntries);
//  
//};
//
//- (BOOL)              application:(UIApplication *)application 
//    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  dispatch_queue_t concurrentQueue = 
//    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//
//  dispatch_once(&onceToken, ^{
//    dispatch_async(concurrentQueue, 
//                   executedOnlyOnce);
//  });
//  
//  dispatch_once(&onceToken, ^{
//    dispatch_async(concurrentQueue, 
//                   executedOnlyOnce);
//  });
//
//  // Override point for customization after application launch.
//  [self.window makeKeyAndVisible];
//  return YES;
//}



- (BOOL)              application:(UIApplication *)application 
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  MySingleton *obj1 = [MySingleton sharedInstance];
  MySingleton *obj2 = [MySingleton sharedInstance];
  MySingleton *obj3 = [MySingleton sharedInstance];
  
  NSLog(@"Object 1 = %@", obj1);
  NSLog(@"Object 2 = %@", obj2);
  NSLog(@"Object 3 = %@", obj3);
  
  // Override point for customization after application launch.
  [self.window makeKeyAndVisible];
  return YES;
}


- (void)dealloc
{
  [_window release];
  [super dealloc];
}

@end
