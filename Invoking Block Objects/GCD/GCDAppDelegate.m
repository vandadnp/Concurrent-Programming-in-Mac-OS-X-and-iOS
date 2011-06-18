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
@synthesize stringProperty;

//void (^simpleBlock)(NSString *) = ^(NSString  *paramString){
//  /* Implement the block object here and use the
//   paramString parameter */
//};
//
//- (void) callSimpleBlock{
//  
//  simpleBlock(@"O'Reilly");
//  
//}







NSString *(^trimString)(NSString *) = ^(NSString *inputString){
  
  NSString *result = [inputString stringByTrimmingCharactersInSet:
                      [NSCharacterSet whitespaceCharacterSet]];
  return result;
  
};

NSString *(^trimWithOtherBlock)(NSString *) = ^(NSString *inputString){
  return trimString(inputString);
};

- (void) callTrimBlock{
  
  NSString *trimmedString = trimWithOtherBlock(@"   O'Reilly    ");
  NSLog(@"Trimmed string = %@", trimmedString);
  
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
  [self callTrimBlock];
  
  /* insideVariable is not defined here and cannot
   be used. outsideVariable is still defined in this scope */
  
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
  [stringProperty release];
  [_window release];
  [super dealloc];
}

@end
