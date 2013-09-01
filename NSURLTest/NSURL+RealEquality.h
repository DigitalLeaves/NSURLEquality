//
//  NSURL+RealEquality.h
//  NSURLTest
//
//  Created by Nacho on 01/09/13.
//  Copyright (c) 2013 Ignacio Nieto Carvajal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (RealEquality)

- (BOOL) fileIsEquivalentTo:(id)object;

@end
