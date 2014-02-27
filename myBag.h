/**************************************************
 *  myBag.h
 *
 *    a class that stores some stuff
 *
 *  part of project:  testObjC_2
 *
 *  Created by John Barr on 10/30/10.
 *  Copyright 2010 John Barr. All rights reserved.
****************************************************/

#import <Foundation/Foundation.h>

/*  An interface provides the delcarations but not the implementation */

@interface myBag : NSObject {
	int numItems;
	NSString *myName;
    // this is the cost
	double cost;
}

/*********************** properties ***********************************/

/*  properties are a technique in Xcode (not objective C)
 * to automatically create accessors and mutatories for
 * instance variables
 *
 *  NOTE:  there are NO access classes in objective C.  No priviate, no
 *         protected no public
 *         By default, everything is "public"
*/

@property (nonatomic, assign) int numItems;
@property (nonatomic, retain) NSString *myName;
@property (nonatomic, assign) double cost;

/********************** methods ****************************************/

// init does not have to be in the interface; all other constructors do
// this demonstrates how methofs with multiple parameters are declared
//  the message is initwithNum:andCost:andName:
//  the parameters are n, c, and s
// To call this (where x is an instance of this class:
//  [x initwithNum: 5 and Cost: 3.45 and Name: "@"John"];
// In reality, this would be used with alloc to create and initialize an
// instance of the myBag class.  See testObjC.m file
- (id) initWithNum: (int) a andCost: (double) b andName: (NSString *) c;

// method preceded by a "-" is an instance method
// method preceded by a "+" is a class method
- (double) calcCost;

- (bool) isEmpty;

- (void) printName: (NSString *) x withMessage: (NSString *) s;


@end
