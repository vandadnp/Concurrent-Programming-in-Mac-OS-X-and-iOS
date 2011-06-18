//
//  GCDAppDelegate_iPhone.h
//  GCD
//
//  Created by Vandad Nahavandipoor on 11-04-06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCDAppDelegate.h"

@interface GCDAppDelegate_iPhone : GCDAppDelegate {
@protected
  UINavigationController *navigationController;
}

@property (nonatomic, retain) UINavigationController *navigationController;

@end
