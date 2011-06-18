//
//  GCDAppDelegate.m
//  GCD
//
//  Created by Vandad Nahavandipoor on 11-04-09.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GCDAppDelegate.h"

@implementation GCDAppDelegate

@synthesize window;

typedef NSString* (^StringTrimmingBlockObject)(NSString *paramString);

NSString* (^trimString)(NSString *) = ^(NSString *paramString){
  NSString *result = nil;
  
  result = [paramString 
            stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceCharacterSet]];
  
  return result;
};

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  
  StringTrimmingBlockObject trimmingBlockObject = Block_copy(trimString);
  
  NSString *trimmedString = trimmingBlockObject(@"   O'Reilly   ");
  
  NSLog(@"Trimmed string = %@", trimmedString);
  
  Block_release(trimmingBlockObject);
  
}


@end
