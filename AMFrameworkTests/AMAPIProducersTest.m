//
//  AMAPIProducersTest.m
//  AMFramework
//
//  Created by Юрий Воскресенский on 26.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ArsenalPayiOsSDK.h"

@interface AMAPIProducersTest: XCTestCase

@end

@implementation AMAPIProducersTest

- (void)testInitMKProducer
{
    AMPaymentRequest *request = [[AMPaymentRequest alloc] init];
    request.payerId = @(9140001111L);
    request.recipientId = @(123456789L);
    request.amount = @(125);
    request.currency = @"RUR";
    request.comment = @"iOs-sdk-test";
    request.test = YES;
    AMMerchantCredentials *credentials = [[AMMerchantCredentials alloc] init];
    credentials.merchantId = @"9987";
    credentials.secret = @"1234567890";
    id <AMAPICommandProducer> producer = [[AMInitPayMkProducer alloc] initWithPaymentRequest:request merchantCredentials:credentials];
    XCTAssertNotNil(producer, @"Producer can't be nil!");
}

@end
