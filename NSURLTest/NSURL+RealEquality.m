//
//  NSURL+RealEquality.m
//  NSURLTest
//
//  Created by Nacho on 01/09/13.
//  Copyright (c) 2013 Ignacio Nieto Carvajal. All rights reserved.
//

#import "NSURL+RealEquality.h"

@implementation NSURL (RealEquality)

- (BOOL) fileIsEquivalentTo:(id)object {
    
    // Safety check. Both need to be URLs.
    if (![object isKindOfClass:[NSURL class]]) return NO;
    NSURL * url = (NSURL *) object;
    
    // Basic check
    if ([self isEqual:url]) return YES;
    
    // Standarized path. Valid for ~ . and ..
    // Does not resolv real paths, though.
    NSString * myPath = [[self path] stringByStandardizingPath];
    NSString * urlPath = [[url path] stringByStandardizingPath];
    if ([myPath isEqualToString:urlPath]) return YES;
    
    // If everything else fails, test if both files point to the same resource (symbolic links, shared files...)
    myPath = [myPath stringByResolvingSymlinksInPath];
    urlPath = [urlPath stringByResolvingSymlinksInPath];
    if ([myPath isEqualToString:urlPath]) return YES; // both files must exist
    
    return NO;
}

@end
