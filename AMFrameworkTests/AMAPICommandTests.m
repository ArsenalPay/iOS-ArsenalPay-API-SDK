//
//  AMAPICommandTests.m
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ArsenalPayiOsSDK.h"

@interface AMAPICommandTests : XCTestCase

@property (strong, nonatomic) AMAPICommand *command;

@end

@implementation AMAPICommandTests

- (void)setUp {
    [super setUp];
    self.command = [[AMAPICommand alloc] initWithBaseURLString:@"https://itunes.apple.com/search" httpMethod:AMGETHTTPRequestMethod parameters:[NSDictionary dictionaryWithObjectsAndKeys:@"the%20doors", @"term", @"20", @"limit", nil]];
}

- (void)tearDown {
    
    [super tearDown];
}

- (void)testURLStringAPICommand
{
    NSLog(@"absolute string: %@", [[[self.command URLRequest] URL] absoluteString]);
    XCTAssertEqualObjects(@"https://itunes.apple.com/search?term=the%20doors&limit=20", [[[self.command URLRequest] URL] absoluteString]);
}

- (void)testForExceptionThrowing
{
    XCTAssertThrowsSpecific([[AMAPICommand alloc] init], NSException, @"should throw an exception");
    XCTAssertThrowsSpecific([[AMAPICommand alloc] initWithBaseURLString:@"https://itunes.apple.com/search" httpMethod:@"sfasdf" parameters:nil], NSException, @"should throw an exception");
}

@end