//
//  main.m
//  NSURLTest
//
//  Created by Nacho on 01/09/13.
//  Copyright (c) 2013 Ignacio Nieto Carvajal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSURL+RealEquality.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSLog(@"NSURL equality tests...");
        
        // test 1. Different starting directory schema
        NSURL * test1A = [NSURL URLWithString:@"file://localhost/var/mobile/Applications/06A3AEBA-8C34-476E-937F-A27BDD2E450A/Documents"];
        NSURL * test1B = [NSURL URLWithString:@"file:///var/mobile/Applications/06A3AEBA-8C34-476E-937F-A27BDD2E450A/Documents"];
        NSLog(@"Test 1.\nA: %@\nB: %@\nisEqual? %@\nisFileEquivalent? %@\n\n",
              test1A, test1B, [test1A isEqual:test1B]?@"YES":@"NO",
              [test1A fileIsEquivalentTo:test1B]?@"YES":@"NO");
        [NSURL URLWithString:@""];
        // test 2. Local home directory and same directory relative paths
        NSURL * test2A = [NSURL URLWithString:@"/Users/Nacho/Library/Application%20Support/iPhone%20Simulator"];
        NSURL * test2B = [NSURL URLWithString:@"~/Library/Application%20Support/./iPhone%20Simulator/"];
        NSLog(@"Test 2.\nA: %@\nB: %@\nisEqual? %@\nisFileEquivalent? %@\n\n",
              test2A, test2B, [test2A isEqual:test2B]?@"YES":@"NO",
              [test2A fileIsEquivalentTo:test2B]?@"YES":@"NO");
        
        // test 3. Previous path
        NSURL * test3A = [NSURL URLWithString:@"~/Library/Application%20Support/../MobileSafari/"];
        NSURL * test3B = [NSURL URLWithString:@"/Users/Nacho/Library/MobileSafari/"];
        NSLog(@"Test 3.\nA: %@\nB: %@\nisEqual? %@\nisFileEquivalent? %@\n\n",
              test3A, test3B, [test3A isEqual:test3B]?@"YES":@"NO",
              [test3A fileIsEquivalentTo:test3B]?@"YES":@"NO");
        
        // test 4. Symbolic links.
        NSURL * test4A = [NSURL URLWithString:@"/Users/Nacho/Downloads/jquery.validate.min.js"];
        NSURL * test4B = [NSURL URLWithString:@"/tmp/validation.js"];
        NSLog(@"Test 4.\nA: %@\nB: %@ (lrwxr-xr-x  ... validation.js -> /Users/Nacho/Downloads/jquery.validate.min.js)\nisEqual? %@\nisFileEquivalent? %@\n\n",
              test4A, test4B, [test4A isEqual:test3B]?@"YES":@"NO",
              [test4A fileIsEquivalentTo:test4B]?@"YES":@"NO");

        
        
    }
    return 0;
}

