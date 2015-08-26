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

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *recipientTextField;
@property (weak, nonatomic) IBOutlet UITextField *sumTextField;

@end

@implementation ViewController

- (IBAction)performPayment
{
    if (self.phoneNumberTextField.text.length > 0 && self.recipientTextField.text.length > 0 && self.sumTextField.text.length > 0)
    {
        id <AMAPICommandsFacade> apiFacade = [[AMAPICommandsFacadeImplementation alloc] init];
        AMPaymentRequest *request = [[AMPaymentRequest alloc] init];
        request.payerId = [NSNumber numberWithLongLong:[self.phoneNumberTextField.text longLongValue]];
        request.recipientId = [NSNumber numberWithLongLong:[self.recipientTextField.text longLongValue]];
        request.amount = [NSNumber numberWithLongLong:[self.sumTextField.text longLongValue]];
        request.currency = @"RUR";
        request.comment = @"iOs-sdk-test";
        request.test = YES;
        [apiFacade requestPayment:request completion:^(AMPaymentResponse *response, NSUInteger statusCode, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (!error)
                {
                    NSLog(@"requestPayment response: %@", response);
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Request payment completed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert show];
                }
                else
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert show];
                    NSLog(@"requestPayment error: %@", error.localizedDescription);
                }
            });
        }];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Fill in all the fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)performTestPayment
{
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
