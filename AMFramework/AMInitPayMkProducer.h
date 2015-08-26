//
//  AMInitPayMkProducer.h
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMAPICommandProducer.h"
#import "AMMerchantCredentials.h"
#import "AMPaymentRequest.h"

/**
 * Producer class for creating mobile payment request
 */
@interface AMInitPayMkProducer : NSObject <AMAPICommandProducer>

- (instancetype)initWithPaymentRequest:(AMPaymentRequest *)request merchantCredentials:(AMMerchantCredentials *)credentials;

@end
