//
//  GCDAppDelegate_iPhone.m
//  GCD
//
//  Created by Vandad Nahavandipoor on 11-04-06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GCDAppDelegate_iPhone.h"
#import "RootViewController_iPhone.h"

@implementation GCDAppDelegate_iPhone

@synthesize navigationController;

- (BOOL)              application:(UIApplication *)application 
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  [super            application:application
  didFinishLaunchingWithOptions:launchOptions];
  
  RootViewController_iPhone *controller = [[RootViewController_iPhone alloc] 
                                           initWithNibName:@"RootViewController_iPhone"
                                           bundle:nil];
  
  UINavigationController *newNC = [[UINavigationController alloc] initWithRootViewController:controller];
  
  [newNC setNavigationBarHidden:YES
                       animated:NO];
  
  navigationController = [newNC retain];
  
  [controller release];
  [newNC release];
  
  
  [[super window] addSubview:navigationController.view];
 
  return YES;
}

- (void)dealloc{
  [navigationController release];
	[super dealloc];
}

@end
