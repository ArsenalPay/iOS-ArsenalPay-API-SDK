//
//  AMAPICommandsFacadeTests.m
//  AMFramework
//
//  Created by Юрий Воскресенский on 26.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ArsenalPayiOsSDK.h"

@interface AMAPICommandsFacadeTests: XCTestCase

@end

@implementation AMAPICommandsFacadeTests

- (void)testAPICommandsFacade
{
    id <AMAPICommandsFacade> apiFacade = [[AMAPICommandsFacadeImplementation alloc] init];
    AMPaymentRequest *request = [[AMPaymentRequest alloc] init];
    request.payerId = @(9140001111L);
    request.recipientId = @(123456789L);
    request.amount = @(125);
    request.currency = @"RUR";
    request.comment = @"iOs-sdk-test";
    request.test = YES;
    __weak XCTestExpectation *expectation = [self expectationWithDescription:@"Start loading data expectation"];
    [apiFacade requestPayment:request completion:^(AMPaymentResponse *response, NSUInteger statusCode, NSError *error) {
        if (!error)
        {
            XCTAssertNotNil(response, @"Response can't be nil!");
            AMPaymentStatusRequest *statusRequest = [[AMPaymentStatusRequest alloc] init];
            statusRequest.transactionId = response.transactionId;
            [apiFacade checkPaymentStatus:statusRequest completion:^(AMPaymentStatusResponse *response, NSUInteger statusCode, NSError *error) {
                XCTAssertNotNil(error, @"Error can't be nil!");
                [expectation fulfill];
            }];
        }
    }];
    [self waitForExpectationsWithTimeout:60 handler:nil];
}

@end
