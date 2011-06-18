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
@synthesize trimmingBlock;

NSString* (^trimString)(NSString *) = ^(NSString *paramString){
  NSString *result = nil;
  
  result = [paramString 
            stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceCharacterSet]];
  
  return result;
};

- (id) autoreleaseTrimStringBlockObject{
  
  return [trimString autorelease];
  
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  self.trimmingBlock = trimString;
  
  NSString *trimmedString = self.trimmingBlock(@"   O'Reilly   ");
  
  NSLog(@"Trimmed string = %@", trimmedString);
  
  // Override point for customization after application launch.
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)dealloc{
  [trimmingBlock release];
  [_window release];
  [super dealloc];
}

@end
