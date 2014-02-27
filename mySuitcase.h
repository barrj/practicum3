//
//  mySuitcase.h
//  testObjC_2
//
//  Created by user on 12/28/10.
//  Copyright 2010 Ithaca College. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "myBag.h"

// Single inheritance only in objective C.
// Objective C also has "categories" which is a means of adding methods to a class
// and "protocols" which are the same as interfaces in Java, a class with empty methods.
//  A class can "adopt" multiple protocols.

@interface mySuitcase : myBag {
	bool theHandle;
	int numPockets;
    // this is the manufacturer
	NSString *manufacturer;
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

@property (nonatomic, assign) bool theHandle;
@property (nonatomic, assign) int numPockets;
@property (nonatomic, retain) NSString *manufacturer;

/********************** methods ****************************************/

- (id) initWithHandle: (bool) a andPockets: (int) b andManufacturer: (NSString *) c;

// a constructor that calls the super constructor
- (id) initWithHandle: (bool) h andPockets: (int) p andManufacturer: (NSString *) m andhNum: (int) a andCost: (double) b andName: (NSString *) c;

- (double) costPerPocket;

@end

