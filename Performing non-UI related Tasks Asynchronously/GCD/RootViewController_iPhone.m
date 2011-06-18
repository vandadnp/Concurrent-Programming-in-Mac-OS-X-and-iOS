//
//  RootViewController_iPhone.m
//  Performing non-UI related Tasks Asynchronously
//
//  Created by Vandad Nahavandipoor on 11-04-09.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController_iPhone.h"


@implementation RootViewController_iPhone

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (NSString *) fileLocation{
  
  /* Get the document folder(s) */
  NSArray *folders = 
  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                      NSUserDomainMask,
                                      YES);
  
  /* Did we find anything? */
  if ([folders count] == 0){
    return nil;
  }
  
  /* Get the first folder */
  NSString *documentsFolder = [folders objectAtIndex:0];
  
  /* Append the file name to the end of the documents path */
  return [documentsFolder 
          stringByAppendingPathComponent:@"list.txt"];
  
}

- (BOOL) hasFileAlreadyBeenCreated{
  
  BOOL result = NO;
  
  NSFileManager *fileManager = [[NSFileManager alloc] init];
  if ([fileManager fileExistsAtPath:[self fileLocation]] == YES){
    result = YES;
  }
  [fileManager release];
  
  return result;
}

//- (void) viewDidAppear:(BOOL)paramAnimated{
//  
//  dispatch_queue_t concurrentQueue = 
//    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//  
//  /* If we have not already saved an array of 10,000
//   random numbers to the disk before, generate these numbers now
//   and then save them to the disk in an array */
//  dispatch_async(concurrentQueue, ^{
//    
//    NSUInteger numberOfValuesRequired = 10000;
//    
//    if ([self hasFileAlreadyBeenCreated] == NO){
//      dispatch_sync(concurrentQueue, ^{
//        
//        NSMutableArray *arrayOfRandomNumbers = 
//        [[NSMutableArray alloc] initWithCapacity:numberOfValuesRequired];
//        
//        NSUInteger counter = 0;
//        for (counter = 0;
//             counter < numberOfValuesRequired;
//             counter++){
//          unsigned int randomNumber = 
//          arc4random() % ((unsigned int)RAND_MAX + 1);
//          
//          [arrayOfRandomNumbers addObject:
//           [NSNumber numberWithUnsignedInt:randomNumber]];
//        }
//        
//        /* Now let's write the array to disk */
//        [arrayOfRandomNumbers writeToFile:[self fileLocation]
//                               atomically:YES];
//        
//        [arrayOfRandomNumbers release];
//        
//      });
//    }
//    
//    __block NSMutableArray *randomNumbers = nil;
//    
//    /* Read the numbers from disk and sort them in an
//     ascending fashion */
//    dispatch_sync(concurrentQueue, ^{
//      
//      /* If the file has now been created, we have to read it */
//      if ([self hasFileAlreadyBeenCreated] == YES){
//        randomNumbers = [[NSMutableArray alloc] 
//                         initWithContentsOfFile:[self fileLocation]];
//        
//        /* Now sort the numbers */
//        [randomNumbers sortUsingComparator:
//         ^NSComparisonResult(id obj1, id obj2) {
//           
//           NSNumber *number1 = (NSNumber *)obj1;
//           NSNumber *number2 = (NSNumber *)obj2;
//           return [number1 compare:number2];
//           
//         }];
//      }
//    });
//    
//    
//    dispatch_async(dispatch_get_main_queue(), ^{
//      if ([randomNumbers count] > 0){
//        /* Refresh the UI here using the numbers in the
//         randomNumbers array */
//      }
//      [randomNumbers release];
//    });
//    
//  });
//  
//}

//- (void) viewDidAppear:(BOOL)paramAnimated{
//  
//  dispatch_queue_t concurrentQueue = 
//  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//  
//  dispatch_async(concurrentQueue, ^{
//    
//    __block UIImage *image = nil;
//    
//    dispatch_sync(concurrentQueue, ^{
//      /* Download the image here */
//      
//      /* iPad's image from Apple's website. Wrap it into two
//       lines as the URL is too long to fit into one line */
//      NSString *urlAsString = @"http://images.apple.com/mobileme/features"\
//                              "/images/ipad_findyouripad_20100518.jpg";
//      
//      NSURL *url = [NSURL URLWithString:urlAsString];
//      
//      NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//      
//      NSError *downloadError = nil;
//      NSData *imageData = [NSURLConnection 
//                           sendSynchronousRequest:urlRequest
//                           returningResponse:nil
//                           error:&downloadError];
//      
//      if (downloadError == nil &&
//          imageData != nil){
//        
//        image = [UIImage imageWithData:imageData];
//        /* We have the image. We can use it now */
//        
//      }
//      else if (downloadError != nil){
//        NSLog(@"Error happened = %@", downloadError);
//      } else {
//        NSLog(@"No data could get downloaded from the URL.");
//      }
//      
//    });
//    
//    dispatch_sync(dispatch_get_main_queue(), ^{
//      /* Show the image to the user here on the main queue*/
//      
//      if (image != nil){
//        /* Create the image view here */
//        UIImageView *imageView = [[UIImageView alloc] 
//                                  initWithFrame:self.view.bounds];
//        
//        /* Set the image */
//        [imageView setImage:image];
//        
//        /* Make sure the image is not scaled incorrectly */
//        [imageView setContentMode:UIViewContentModeScaleAspectFit];
//        
//        /* Add the image to this view controller's view */
//        [self.view addSubview:imageView];
//        
//        /* Release the image view */
//        [imageView release];
//        
//      } else {
//        NSLog(@"Image isn't downloaded. Nothing to display.");
//      }
//      
//    });
//    
//  });
//  
//}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
