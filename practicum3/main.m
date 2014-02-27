//
//  main.m
//  Hello_Obj_C
//
//  Created by John Barr on 1/27/13.
//  Copyright (c) 2013 John Barr. All rights reserved.
//
/* import is same as include but guarantees file won't be included more
 than once (no need for #if statements).
 
 Foundation.h is an Apple framework.  Includes data structures, communication.
 Cocoa consists of two frameworks, Foundation and Application.
 Applicaion (called "AppKit") contains the interface classes.
 
 Headers are precompiled.
 */
#import <Foundation/Foundation.h>

#import "myBag.h"
#import "mySuitcase.h"

/*  testPrint
 *  Parameters:  NSString *testString  the string to print
 *  Return:  nothing
 *  Purpose:  just to show what a function looks like
 */
void testPrint(NSString *testString)
{
    NSLog(@"This is the test string:  %@", testString);
}

int main (int argc, const char * argv[]) {
	// create an auto relase pool.  Then put dynamically allocated
	// instances in this pool.  The pool will be auotmatically
	// released when method ends.
    // not needed with automatic memory allocation
    // NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // NSLog is like printf except that it understands NS classes
	// like NSString; also prints a timestamp and adds a newline
    NSLog(@"Hello, World!");
	
	// all objects must be explicit pointers
	//  can also use the following line; these are the same
	// myBag *xBag = [myBag new];
	// Calling new will automatically call the init method if it exists
	// ALWAYS chain alloc and init like this because init might return
	// a new object
	myBag *xBag = [[myBag alloc] init];
	// id is a generic pointer (to an instance) type.  Allows for dynamic typing
	// The previous line could have been:
	//id xBag = [myBag new];
	
	// if you alloc something you must either autorelease it
	//  so that its released when the pool is released or
	//  release it when you're finished with it (using [myBag release])
    // not needed with automatic memory allocation
	// [myBag autorelease];
	
	// a mutable array can have it's length changed dynamically
	// Note that most NS defined collections CANNOT hold primitive types
	// such as int or char.  You have to wrap these in objects before
	// you can put them into a NS collection.  For example, NSNumber
	// is a wrapper for an int.
	// NS collections cannot hold the value nil either.  If you want
	// an empty item in a collection, use the object NSNull.
	NSMutableArray *lots_O_Bags = [[NSMutableArray alloc] init];
    // not needed with automatic memory allocation
	// [lots_O_Bags autorelease];
	
	
	[xBag setNumItems:20];
	// objective C also defines the dot notation as an alias for message passing
	// [xBag setCost:12.5];
	xBag.cost = 12.5;
	[lots_O_Bags addObject:xBag];
	
	xBag = [[myBag alloc] initWithNum: 20 andCost: 23.7 andName: @"George"];
	
	double theCost = [[lots_O_Bags objectAtIndex:0] calcCost];
	NSLog(@"Cost is %f", theCost);
	printf("Printf says the cost is: %f\n", theCost);
	NSLog(@"Name of first bag is %@\n", [[lots_O_Bags objectAtIndex:0] myName]);
	
	// setters and getter generated automatically by property
	// the %@ indicates an NSString.  Can use regular printf types also.
	NSLog(@"xBag's name before changing is: %@ and number of items is %d", xBag.myName, xBag.numItems);
	xBag.myName = @"Barak";
	NSLog(@"xBag's name after changing is: %@", xBag.myName);
	
	if ([xBag isEmpty] == YES)
		NSLog(@"xBag is Empty");
	else {
		NSLog(@"xBag is not Empty");
	}
	
	xBag.numItems = 0;
    
	// objectiveC has a bool type with values YES and NO
	// but these are actually defined to 1 and 0 respectively
	if ([xBag isEmpty] == YES)
		NSLog(@"xBag is Empty");
	else {
		NSLog(@"xBag is not Empty");
	}
	
	
	// now call a method that is implemented but not in the interface
	// This demonstrates that nothing is private
	// Note that Xcode will give the next line a warning because
	// the method printName is not in the interface.  But it'll work.
	[xBag printName: @"testName" withMessage: @"Hi, how are you?"];
	
	
	// have the object print itself
	// the method "description" in the class myBag is called by NSLog
	NSLog (@"%@", xBag);
	
	// now create an instance of the child of theBag
	mySuitcase *xCase = [[mySuitcase alloc] initWithHandle: YES andPockets: 4 andManufacturer: @"Mattel"];
	
	// test an inherited method
	NSLog(@"my suitcase has %d pockets and its name is %@", xCase.numPockets, xCase.myName);
	[xCase setCost:297.99];
	NSLog(@"the cost per pocket is: %f", [xCase costPerPocket] );
	
	// have the object print itself
	// the method "description" in the class mySuitcase is called by NSLog
	// You must create a "description" method when you create a class.
	NSLog (@"%@", xCase);
    
    [lots_O_Bags addObject:xCase];
    NSLog(@"Name of second bag is %@\n", [[lots_O_Bags objectAtIndex:0] myName]);
    
    // now use the super init also
    mySuitcase *yCase = [[mySuitcase alloc] initWithHandle: YES andPockets: 4 andManufacturer: @"Mattel" andhNum: 5 andCost: 100.59 andName: @"Samsonite"];
    
    NSLog(@"yCase has number %d", [yCase numItems]);
    
    // and here's an example of a function that is defined in main.m  It's just a regular C function
    testPrint(@"Here's a test string");
	
	// not needed with automatic memory allocation
    // [pool drain];
    return 0;
}


