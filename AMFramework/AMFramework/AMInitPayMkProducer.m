//
//  AMInitPayMkProducer.m
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "AMInitPayMkProducer.h"
#import "AMConstants.h"
#import "AMSecurityUtilities.h"

@interface AMInitPayMkProducer()

@property (strong, nonatomic) AMPaymentRequest *request;
@property (strong, nonatomic) AMMerchantCredentials *credentials;

@end

@implementation AMInitPayMkProducer

- (instancetype)init
{
    NSException *exception = [NSException exceptionWithName:@"AMInvalidInitializerException" reason:@"Use initWithPaymentRequest:merchantCredentials: selector to init the object!" userInfo:nil];
    @throw exception;
    return nil;
}

- (instancetype)initWithPaymentRequest:(AMPaymentRequest *)request merchantCredentials:(AMMerchantCredentials *)credentials
{
    if (self = [super init])
    {
        self.request = request;
        self.credentials = credentials;
    }
    return self;
}

- (AMAPICommand *)command
{
    NSString *account = [self.request.recipientId stringValue];
    NSString *phone = [self.request.payerId stringValue];
    NSString *amount = [self.request.amount stringValue];
    
    NSString *merchantId = self.credentials.merchantId;
    NSString *secret = self.credentials.secret;
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:merchantId forKey:@"ID"];
    [parameters setObject:account forKey:@"ACCOUNT"];
    [parameters setObject:phone forKey:@"PHONE"];
    [parameters setObject:amount forKey:@"AMOUNT"];
    [parameters setObject:@"RUR" forKey:@"CURRENCY"];
    [parameters setObject:AMInitPayMK forKey:@"FUNCTION"];

    NSString *signature = [AMSecurityUtilities signatureWithSecret:secret values:@[merchantId, AMInitPayMK, account, phone, amount]];
    [parameters setObject:signature forKey:@"SIGN"];
    AMAPICommand *apiCommand = [[AMAPICommand alloc] initWithBaseURLString:[NSString stringWithFormat:@"%@%@",AMBaseURLString, AMInitPayMK] httpMethod:AMPOSTHTTPRequestMethod parameters:parameters];
    return apiCommand;
}

@end
