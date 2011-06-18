//
//  GCDAppDelegate.h
//  GCD
//
//  Created by Vandad Nahavandipoor on 11-04-06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSString* (^StringTrimmingBlockObject)(NSString *paramString);

@interface GCDAppDelegate : NSObject <UIApplicationDelegate> {
@protected
  StringTrimmingBlockObject   trimmingBlock;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, copy) StringTrimmingBlockObject   trimmingBlock;

@end
