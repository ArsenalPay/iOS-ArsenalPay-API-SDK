//
//  AMInitPayMkStatusProducer.h
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMAPICommandProducer.h"
#import "AMMerchantCredentials.h"
#import "AMPaymentStatusRequest.h"

/**
 * Producer class for creating mobile payment status checking request
 */
@interface AMInitPayMkStatusProducer : NSObject <AMAPICommandProducer>

- (instancetype)initWithPaymentRequest:(AMPaymentStatusRequest *)request merchantCredentials:(AMMerchantCredentials *)credentials;

@end
