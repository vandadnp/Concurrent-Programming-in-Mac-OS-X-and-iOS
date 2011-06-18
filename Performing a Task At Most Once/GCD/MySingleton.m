//
//  MySingleton.m
//  Performing a Task At Most Once
//
//  Created by Vandad Nahavandipoor on 11-04-09.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MySingleton.h"

@implementation MySingleton

static MySingleton *sharedMySingleton = NULL;

+ (MySingleton *) sharedInstance{
  
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    if (sharedMySingleton == NULL){
      sharedMySingleton = [[super allocWithZone:NULL] init];
    }
  });
  
  return sharedMySingleton;
}

+ (id) allocWithZone:(NSZone *)paramZone{
  return [[self sharedInstance] retain];
  
}

- (id) copyWithZone:(NSZone *)paramZone{
  return self;
}

- (void) release{
  /* Do nothing */
}

- (id) autorelease{
  return self;
}

- (NSUInteger) retainCount{
  return NSUIntegerMax;
}

- (id) retain{
  return self;
}

@end