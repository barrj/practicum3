/*
 *  mySuitcase.m
 *  testObjC_2
 *
 *  Created by John Barr on 10/30/10.
 *  Copyright 2010 John Barr. All rights reserved.
 */

#import "mySuitcase.h"


@implementation mySuitcase

// You no longer have to synthesize properties...but  the setter and getter names that are generated begin with an underscore
@synthesize theHandle;
@synthesize numPockets;
@synthesize manufacturer;

// init does not need to be in the interface
- (id) init
{
    // always start init with the if statemtn
	// the super may fail
	if (self = [super init]) {
		theHandle = YES;
		numPockets = 5;
		manufacturer = @"Apple";
		NSLog(@"I'm in the init method");
		
		// always return self; allows nesting
		return (self);
	}
	return nil;
} // init

- (id) initWithHandle: (bool) h andPockets: (int) p andManufacturer: (NSString *) m andhNum: (int) a andCost: (double) b andName: (NSString *) c

{
	if (self = [super initWithNum: (int) a andCost: (double) b andName: (NSString *) c])
	{
		theHandle = h;
		numPockets = p;
        // don't need this with auto memory allocation
		//[m retain];
		manufacturer = m;
		return (self);
	}
	return nil;
	
}

- (id) initWithHandle: (bool) h andPockets: (int) p andManufacturer: (NSString *) m
{
	if (self = [super init])
	{ 
		theHandle = h;
		numPockets = p;
        // don't need this with auto memory allocation
		//[m retain];
		manufacturer = m;
		return (self);
	}
	return nil;
	
} // end parameterized constructor

- (double) costPerPocket
{
    // the cost is how much it cost
	return (cost / numPockets);
}

// This method is not in the .h file.  It is called when you print an instance of this class
// The method is used to allow a class to print out a string describing itself.
- (NSString *) description
{
	return(@"I am a suitcase");
}  // description

@end