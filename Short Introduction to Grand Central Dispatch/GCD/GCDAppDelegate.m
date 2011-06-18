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

- (void) doCalculation{
  
  /* Do your calculation here */
  
}

//- (void) calculationThreadEntry{
//  
//  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//  
//  NSUInteger counter = 0;
//  
//  while ([[NSThread currentThread] isCancelled] == NO){
//
//    [self doCalculation];
//    
//    counter++;
//    
//    if (counter >= 1000){
//      break;
//    }
//    
//  }
//  
//  [pool release];
//  
//}
//
//- (BOOL)              application:(UIApplication *)application 
//    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  /* Start the thread */
//  [NSThread detachNewThreadSelector:@selector(calculationThreadEntry) 
//                           toTarget:self
//                         withObject:nil];
//  
//  // Override point for customization after application launch.
//  [self.window makeKeyAndVisible];
//  return YES;
//}


- (BOOL)              application:(UIApplication *)application 
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{

  
  dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  
  dispatch_async(queue, ^(void) {
    NSUInteger counter = 0;
    for (counter = 0;
         counter < 1000;
         counter++){
      
      NSLog(@"Block 1 - Iteration: %lu - Thread: %@", (unsigned long)counter, [NSThread currentThread]);
      
    }
  });
  
  dispatch_async(queue, ^(void) {
    NSUInteger counter = 0;
    for (counter = 0;
         counter < 1000;
         counter++){
      
      NSLog(@"Block 2 - Iteration: %lu - Thread: %@", (unsigned long)counter, [NSThread currentThread]);
      
    }
  });
  
//  dispatch_queue_t queue = 
//    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//  
//  /* You can change this number */
//  size_t numberOfIterations = 1000;
//  
//  dispatch_async(queue, ^(void) {
//    dispatch_apply(numberOfIterations, queue, ^(size_t iteration){
//      /* Perform the operation here */
//    });
//  });
  
  
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
