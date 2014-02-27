/*
 *  myBag.m
 *  testObjC_2
 *
 *  Created by John Barr on 10/30/10.
 *  Copyright 2010 John Barr. All rights reserved.
*/

#import "myBag.h"


@implementation myBag

/*************** synthesizing properties *********************
 * this will automatically create an accessor and a mutator
 * for each variable.  The accessor is simply named "VariableName"
 *  setters are named "setVariableName"
 *  Do NOT use "get" in front of a variable name like  "getVariableName"
 * Macros are also created so that you can use Java dot syntax,
 * i.e., if there is an instance of myBag named x you can do
 * int y = x.numItems;  or x.numItems = 12;
 *************************************************************/

// You no longer have to synthesize properties...but  the setter and getter names that are generated begin with an underscore
@synthesize numItems;
@synthesize myName;
@synthesize cost;

// init does not need to be in the interface
- (id) init
{
    // always start init with the if statemtn
	// the super may fail.  This is the convention in
	// objective C.  The super may return a new object.
	// Do the assignment inside the if in case nil is returned
	if (self = [super init]) {
		numItems = 10;
		cost = 10.0;
		myName = @"John";
		NSLog(@"I'm in the myBag init method");
		
		// always return self; allows nesting
		return (self);
	}
	return nil;
} // init

/*  initwithNum:andCost:andName:
 *  This initiator (constructor) has to be in the interface.  All constructors must
 *  first call the super constructor with init
 *  
 *  Here's a weird feature of objective C:  the parameter names in the implementation
 *  can be different from the names in the interface!!
*/

- (id) initWithNum: (int) n andCost: (double) c andName: (NSString *) s
{
	if (self = [super init])
	{ 
		numItems = n;
		cost = c;
        // don't need this with auto memory allocation
		//[s retain];
		myName = s;
		return (self);
	}
	return nil;
} // initwithNum

- (double) calcCost
{
	float newCost = cost * numItems;
	return newCost;
}

- (bool) isEmpty
{
	if (numItems == 0)
		return YES;
	return NO;
}

/* method printName
 *  note that a method does not have to be in the interface
 *  also note that there are NO private methods.  This method
 *  can be called by any instance of a myBag.
 */
- (void) printName: (NSString *) x withMessage: (NSString *) s
{
	// the %@ in the string will be replaced by calling the 
	// description method of  the instance x
	NSLog(@"Hi %@, your message is: %@", x, s);
}

// This method is not in the .h file.  It is called when you print an instance of this class
// The method is used to allow a class to print out a string describing itself.
- (NSString *) description
{
    // this class is a bag
    // this is a comment
	return(@"I am a bag");
}  // description



@end
