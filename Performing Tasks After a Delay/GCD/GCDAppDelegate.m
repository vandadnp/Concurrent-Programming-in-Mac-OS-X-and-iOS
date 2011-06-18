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

//- (void) printString:(NSString *)paramString{
//  
//  NSLog(@"%@", paramString);
//  
//}
//
//- (BOOL)              application:(UIApplication *)application 
//    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  @selector(performSelector:withObject:afterDelay:)
//  
//  [self performSelector:@selector(printString:)
//             withObject:@"Grand Central Dispatch"
//             afterDelay:3.0];
//  
//  // Override point for customization after application launch.
//  [self.window makeKeyAndVisible];
//  return YES;
//}

void processSomething(void *paramContext){
  
  /* Do your processing here */
  NSLog(@"Processing...");
  
}

- (BOOL)              application:(UIApplication *)application 
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  double delayInSeconds = 2.0;
  
  dispatch_time_t delayInNanoSeconds = 
    dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
  
  dispatch_queue_t concurrentQueue = 
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  
  dispatch_after_f(delayInNanoSeconds, 
                    concurrentQueue, 
                   NULL,
                   processSomething);
  
  // Override point for customization after application launch.
  [self.window makeKeyAndVisible];
  return YES;
}

//- (BOOL)              application:(UIApplication *)application 
//    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  double delayInSeconds = 2.0;
//  
//  dispatch_time_t delayInNanoSeconds = 
//    dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//  
//  dispatch_queue_t concurrentQueue = 
//    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//  
//  dispatch_after(delayInNanoSeconds, concurrentQueue, ^(void){
//    /* Perform your operations here */
//  });
//
//  // Override point for customization after application launch.
//  [self.window makeKeyAndVisible];
//  return YES;
//}


- (void)dealloc
{
  [_window release];
  [super dealloc];
}

@end
