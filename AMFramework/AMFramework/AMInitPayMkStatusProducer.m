//
//  AMInitPayMkStatusProducer.m
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "AMInitPayMkStatusProducer.h"
#import "AMSecurityUtilities.h"
#import "AMConstants.h"

static NSString * const kInitPayMKStatus = @"init_pay_mk_status";

@interface AMInitPayMkStatusProducer()

@property (strong, nonatomic) AMPaymentStatusRequest *request;
@property (strong, nonatomic) AMMerchantCredentials *credentials;

@end

@implementation AMInitPayMkStatusProducer

- (instancetype)init
{
    NSException *exception = [NSException exceptionWithName:@"AMInvalidInitializerException" reason:@"Use initWithPaymentRequest:merchantCredentials: selector to init the object!" userInfo:nil];
    @throw exception;
    return nil;
}

- (instancetype)initWithPaymentRequest:(AMPaymentStatusRequest *)request merchantCredentials:(AMMerchantCredentials *)credentials
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
    NSString *rrn = [self.request.transactionId stringValue];
    
    NSString *merchantId = self.credentials.merchantId;
    NSString *secret = self.credentials.secret;
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:merchantId, @"ID", kInitPayMKStatus, @"FUNCTION", rrn, @"RRN", nil];
    NSString *signature = [AMSecurityUtilities signatureWithSecret:secret values:@[merchantId, kInitPayMKStatus, rrn]];
    [parameters setObject:signature forKey:@"SIGN"];
    AMAPICommand *apiCommand = [[AMAPICommand alloc] initWithBaseURLString:[NSString stringWithFormat:@"%@%@",AMBaseURLString, AMInitPayMK] httpMethod:AMPOSTHTTPRequestMethod parameters:parameters];
    return apiCommand;
}

@end
