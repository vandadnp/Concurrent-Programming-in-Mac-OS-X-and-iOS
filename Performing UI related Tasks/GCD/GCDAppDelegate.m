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

//- (BOOL)              application:(UIApplication *)application 
//    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  dispatch_queue_t mainQueue = dispatch_get_main_queue();
//  
//  dispatch_async(mainQueue, ^(void) {
//    NSLog(@"Current thread = %@", [NSThread currentThread]);
//    NSLog(@"Main thread = %@", [NSThread mainThread]);
//  });
//  
//  // Override point for customization after application launch.
//  [self.window makeKeyAndVisible];
//  return YES;
//}


typedef struct{
  char *title;
  char *message;
  char *cancelButtonTitle;
} AlertViewData;

void displayAlertView(void *paramContext){
  
  AlertViewData *alertData = (AlertViewData *)paramContext;
  
  NSString *title = 
  [NSString stringWithUTF8String:alertData->title];
  
  NSString *message = 
  [NSString stringWithUTF8String:alertData->message];
  
  NSString *cancelButtonTitle = 
  [NSString stringWithUTF8String:alertData->cancelButtonTitle];
  
  [[[[UIAlertView alloc] initWithTitle:title
                               message:message
                              delegate:nil
                     cancelButtonTitle:cancelButtonTitle
                     otherButtonTitles:nil, nil] autorelease] show];
  
  free(alertData);
  
}

- (BOOL)              application:(UIApplication *)application 
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  dispatch_queue_t mainQueue = dispatch_get_main_queue();
  
  AlertViewData *context = (AlertViewData *)
    malloc(sizeof(AlertViewData));
  
  if (context != NULL){
    context->title = "GCD";
    context->message = "GCD is amazing.";
    context->cancelButtonTitle = "OK";
    
    dispatch_async_f(mainQueue, 
                     (void *)context, 
                     displayAlertView);
  }
  
  // Override point for customization after application launch.
  [self.window makeKeyAndVisible];
  return YES;
}

//- (BOOL)              application:(UIApplication *)application 
//    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  dispatch_queue_t mainQueue = dispatch_get_main_queue();
//  
//  dispatch_async(mainQueue, ^(void) {
//    
//    [[[[UIAlertView alloc]
//       initWithTitle:NSLocalizedString(@"GCD", nil)
//       message:NSLocalizedString(@"GCD is amazing!", nil)
//       delegate:nil 
//       cancelButtonTitle:NSLocalizedString(@"OK", nil)
//       otherButtonTitles:nil, nil] autorelease] show];
//    
//  });
//  
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
