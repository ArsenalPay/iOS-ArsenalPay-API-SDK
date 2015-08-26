//
//  AMAPICommandsFacadeImplementation.h
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMAPICommandsFacade.h"
#import "AMAPIClient.h"
#import "AMMerchantCredentials.h"

/**
 * <p>The main and now a single implementation of ApiCommandsFacade.</p>
 *
 * <p>By default (default constructor) for communications with ArsenalPay Api Server use NSURLSession
 * configured for concurrency environment. But if you want you can use your own implementation of ApiClient interface.
 * In special some cases it may be relevant for example if you want to create http connections using one tool throughout
 * the application or you for some reason are not satisfied with the default implementation.
 * We do so, because we understand that it is your application and you master it.
 * We appreciate this freedom and do not impose anything.</p>
 */
@interface AMAPICommandsFacadeImplementation : NSObject <AMAPICommandsFacade>

/**
 * This constructor is for your freedom.
 * Simply implement ApiClient interface with your favorite http client with your configuration and
 * AMAPICommandsFacade will use it for communication with ArsenalPay Server API.
 * @param apiClient -- implementation of ApiClient interface
 */
- (instancetype)initWithAPIClient:(id <AMAPIClient>)apiClient;

/**
 * Connection is configured for work in concurrency environment.
 * AMMerchantCredentials are id and secret given to you at registration.
 * Take a note: merchantCredentials witch were set in conf/sdk.properties will be ignored!
 */
- (instancetype)initWithMerchantCredentials:(AMMerchantCredentials *)credentials;

/**
 * This constructor is for your absolute freedom.
 * Connection is configured for work in concurrency environment.
 * AMMerchantCredentials are id and secret given to you at registration.
 * Take a note: merchantCredentials witch were set in conf/sdk.properties will be ignored!
 */
- (instancetype)initWithAPIClient:(id <AMAPIClient>)apiClient merchantCredentials:(AMMerchantCredentials *)credentials NS_DESIGNATED_INITIALIZER;

@end
