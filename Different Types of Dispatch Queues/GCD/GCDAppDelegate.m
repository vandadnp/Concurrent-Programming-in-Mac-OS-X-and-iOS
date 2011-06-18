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


- (BOOL)              application:(UIApplication *)application 
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{

  dispatch_queue_t mainQueue = dispatch_get_main_queue();
  
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
