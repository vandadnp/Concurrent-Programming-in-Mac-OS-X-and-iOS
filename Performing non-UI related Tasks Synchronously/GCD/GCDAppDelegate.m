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

//void (^printFrom1To1000)(void) = ^{
//  
//  NSUInteger counter = 0;
//  for (counter = 1;
//       counter <= 1000;
//       counter++){ 
//    
//    NSLog(@"Counter = %lu - Thread = %@",
//          (unsigned long)counter,
//          [NSThread currentThread]);
//    
//  }
//  
//};

//- (BOOL)              application:(UIApplication *)application 
//    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  dispatch_queue_t concurrentQueue = 
//  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//  
//  dispatch_sync(concurrentQueue, printFrom1To1000);
//  dispatch_sync(concurrentQueue, printFrom1To1000);
//  
//  // Override point for customization after application launch.
//  [self.window makeKeyAndVisible];
//  return YES;
//}


void printFrom1To1000(void *paramContext){
  
  NSUInteger counter = 0;
  for (counter = 1;
       counter <= 1000;
       counter++){ 
    
    NSLog(@"Counter = %lu - Thread = %@",
          (unsigned long)counter,
          [NSThread currentThread]);
    
  }
  
}

- (BOOL)              application:(UIApplication *)application 
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  
  dispatch_queue_t concurrentQueue = 
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  
  dispatch_sync_f(concurrentQueue, 
                  NULL,
                  printFrom1To1000);
  
  dispatch_sync_f(concurrentQueue, 
                  NULL,
                  printFrom1To1000);
  
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
