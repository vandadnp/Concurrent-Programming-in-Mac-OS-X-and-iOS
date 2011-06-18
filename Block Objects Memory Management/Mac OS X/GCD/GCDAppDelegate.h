//
//  GCDAppDelegate.h
//  GCD
//
//  Created by Vandad Nahavandipoor on 11-04-09.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface GCDAppDelegate : NSObject <NSApplicationDelegate> {
@private
  NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
