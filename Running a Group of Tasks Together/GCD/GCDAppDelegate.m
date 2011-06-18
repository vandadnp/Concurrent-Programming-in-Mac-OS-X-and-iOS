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

- (void) reloadTableView{
  /* Reload the table view here */
  NSLog(@"%s", __FUNCTION__);
}

- (void) reloadScrollView{
  /* Do the work here */
  NSLog(@"%s", __FUNCTION__);
}

- (void) reloadImageView{
  /* Reload the image view here */
  NSLog(@"%s", __FUNCTION__);
}

void reloadAllComponents(void *context){
  
  GCDAppDelegate *self = (GCDAppDelegate *)context;
  [self reloadTableView];
  [self reloadScrollView];
  [self reloadImageView];
  
}

- (BOOL)              application:(UIApplication *)application 
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  dispatch_group_t taskGroup =  dispatch_group_create();
  dispatch_queue_t mainQueue =  dispatch_get_main_queue();
  
  dispatch_group_async_f(taskGroup, 
                         mainQueue, 
                         (void *)self, 
                         reloadAllComponents);
    
  /* At the end when we are done, dispatch the following block */
  dispatch_group_notify(taskGroup, mainQueue, ^{
    /* Do some processing here */
    
    [[[[UIAlertView alloc] initWithTitle:@"Finished"
                                 message:@"All tasks are finished"
                                delegate:nil 
                       cancelButtonTitle:@"OK"
                       otherButtonTitles:nil, nil] autorelease] show];
    
  });
  
  /* We are done with the group */
  dispatch_release(taskGroup);
  
  // Override point for customization after application launch.
  [self.window makeKeyAndVisible];
  return YES;
}


//- (BOOL)              application:(UIApplication *)application 
//    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//
//  dispatch_group_t taskGroup =  dispatch_group_create();
//  dispatch_queue_t mainQueue =  dispatch_get_main_queue();
//  
//  /* Reload the table view on the main queue */
//  dispatch_group_async(taskGroup, mainQueue, ^{
//    [self reloadTableView];
//  });
//  
//  /* Reload the scroll view on the main queue */
//  dispatch_group_async(taskGroup, mainQueue, ^{
//    [self reloadScrollView];
//  });
//  
//  /* Reload the image view on the main queue */
//  dispatch_group_async(taskGroup, mainQueue, ^{
//    [self reloadImageView];
//  });
//  
//  /* At the end when we are done, dispatch the following block */
//  dispatch_group_notify(taskGroup, mainQueue, ^{
//    /* Do some processing here */
//    
//    [[[[UIAlertView alloc] initWithTitle:@"Finished"
//                                 message:@"All tasks are finished"
//                                delegate:nil 
//                       cancelButtonTitle:@"OK"
//                       otherButtonTitles:nil, nil] autorelease] show];
//    
//  });
//  
//  /* We are done with the group */
//  dispatch_release(taskGroup);
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
