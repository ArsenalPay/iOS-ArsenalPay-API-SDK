//
//  AMResponseTests.m
//  AMFramework
//
//  Created by Юрий Воскресенский on 26.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ArsenalPayiOsSDK.h"

@interface AMResponseTests: XCTestCase

@end

@implementation AMResponseTests

- (void)testForSuccessfullAPIResponseParsing
{
    NSDictionary *xml = [NSDictionary dictionaryWithObjectsAndKeys: @"12345", @"account", @"OK", @"status", nil];
    NSError *error = nil;
    AMAbstractResponse *response = [AMAbstractResponse fromXML:xml error:&error];
    XCTAssertNotNil(response, @"Response can't be nil in this case!");
    XCTAssertNil(error, @"Error must be nil!");
}

- (void)testForFailedAPIResponseParsing
{
    NSDictionary *xml = [NSDictionary dictionaryWithObjectsAndKeys: @"12345", @"account", @"NO_ANSWER", @"status", nil];
    NSError *error = nil;
    AMAbstractResponse *response = [AMAbstractResponse fromXML:xml error:&error];
    XCTAssertNil(response, @"Response must be nil!");
    XCTAssertNotNil(error, @"Error must not be nil!");
}

@end
