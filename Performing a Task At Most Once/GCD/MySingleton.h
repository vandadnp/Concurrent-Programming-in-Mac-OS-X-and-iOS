//
//  MySingleton.h
//  Performing a Task At Most Once
//
//  Created by Vandad Nahavandipoor on 11-04-09.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MySingleton : NSObject {
    
}

+ (MySingleton *) sharedInstance;

@end
