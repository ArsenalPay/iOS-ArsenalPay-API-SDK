//
//  ViewController.m
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "ViewController.h"
#import "ArsenalPayiOsSDK.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    id <AMAPICommandsFacade> apiFacade = [[AMAPICommandsFacadeImplementation alloc] init];
    AMPaymentRequest *request = [[AMPaymentRequest alloc] init];
    request.payerId = @(9140001111L);
    request.recipientId = @(123456789L);
    request.amount = @(125);
    request.currency = @"RUR";
    request.comment = @"iOs-sdk-test";
    request.test = YES;
    [apiFacade requestPayment:request completion:^(AMPaymentResponse *response, NSUInteger statusCode, NSError *error) {
        if (!error)
        {
            NSLog(@"requestPayment response: %@", response);
            AMPaymentStatusRequest *statusRequest = [[AMPaymentStatusRequest alloc] init];
            statusRequest.transactionId = response.transactionId;
            [apiFacade checkPaymentStatus:statusRequest completion:^(AMPaymentStatusResponse *response, NSUInteger statusCode, NSError *error) {
                if (!error) NSLog(@"checkPaymentStatus response: %@", response);
                else NSLog(@"checkPaymentStatus error: localizedDescription: %@", error.localizedDescription);
            }];
        }
        else NSLog(@"requestPayment error: localizedDescription: %@", error.localizedDescription);
    }];
}

@end
