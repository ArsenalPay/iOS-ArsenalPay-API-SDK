//
//  AMAPICommandsFacadeImplementation.m
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "AMAPICommandsFacadeImplementation.h"
#import "AMURLSessionAPIImplementation.h"
#import "AMAPICommandProducer.h"
#import "AMAPICommand.h"
#import "AMInitPayMkProducer.h"
#import "AMInitPayMkStatusProducer.h"
#import "XMLDictionary.h"

static NSString * const kTestMerchantId = @"9987";
static NSString * const kTestSecret = @"1234567890";

@interface AMAPICommandsFacadeImplementation()

@property (strong, nonatomic) id <AMAPIClient> apiClient;
@property (strong, nonatomic) AMMerchantCredentials *credentials;

@end

@implementation AMAPICommandsFacadeImplementation

- (instancetype)init
{
    AMMerchantCredentials *credentials = [[AMMerchantCredentials alloc] init];
    credentials.merchantId = kTestMerchantId;
    credentials.secret = kTestSecret;
    return [self initWithAPIClient:[[AMURLSessionAPIImplementation alloc] init] merchantCredentials:credentials];
}

- (instancetype)initWithAPIClient:(id<AMAPIClient>)apiClient
{
    AMMerchantCredentials *credentials = [[AMMerchantCredentials alloc] init];
    credentials.merchantId = kTestMerchantId;
    credentials.secret = kTestSecret;
    return [self initWithAPIClient:apiClient merchantCredentials:credentials];
}

- (instancetype)initWithMerchantCredentials:(AMMerchantCredentials *)credentials
{
    return [self initWithAPIClient:[[AMURLSessionAPIImplementation alloc] init] merchantCredentials:credentials];
}

- (instancetype)initWithAPIClient:(id<AMAPIClient>)apiClient merchantCredentials:(AMMerchantCredentials *)credentials
{
    if (self = [super init])
    {
        self.apiClient = apiClient;
        self.credentials = credentials;
    }
    return self;
}

- (void)requestPayment:(AMPaymentRequest *)request completion:(AMPaymentRequestCompletion)completion
{
    id <AMAPICommandProducer> producer = [[AMInitPayMkProducer alloc] initWithPaymentRequest:request merchantCredentials:self.credentials];
    [self sendRequestForProducer:producer completion:^(NSUInteger statusCode, NSDictionary *xml, NSError *error) {
        NSError *responseError = nil;
        AMPaymentResponse *response = [AMPaymentResponse fromXML:xml error:&responseError];
        if (error)
        {
            if (completion) completion(response, statusCode, error);
        }
        else
        {
            if (completion) completion(response, statusCode, responseError);
        }
    }];
}

- (void)checkPaymentStatus:(AMPaymentStatusRequest *)request completion:(AMPaymentStatusRequestCompletion)completion
{
    id <AMAPICommandProducer> producer = [[AMInitPayMkStatusProducer alloc] initWithPaymentRequest:request merchantCredentials:self.credentials];
    [self sendRequestForProducer:producer completion:^(NSUInteger statusCode, NSDictionary *xml, NSError *error) {
        NSError *responseError = nil;
        AMPaymentStatusResponse *response = [AMPaymentStatusResponse fromXML:xml error:&responseError];
        if (error)
        {
            if (completion) completion(response, statusCode, error);
        }
        else
        {
            if (completion) completion(response, statusCode, responseError);
        }
    }];
}

- (void)sendRequestForProducer:(id <AMAPICommandProducer>)producer completion:(void(^)(NSUInteger statusCode, NSDictionary *xml, NSError *error))completion
{
    AMAPICommand *command = [producer command];
    [self.apiClient executeCommand:command completion:^(NSUInteger statusCode, NSData *response, NSError *error)
    {
        NSDictionary *xmlDictionary = [NSDictionary dictionaryWithXMLData:response];
        if (completion) completion(statusCode, xmlDictionary, error);
    }];
}

@end
