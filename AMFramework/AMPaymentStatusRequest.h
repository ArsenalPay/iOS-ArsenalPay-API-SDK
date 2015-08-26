//
//  AMPaymentStatusRequest.h
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * <p>PaymentStatusRequest is need for check payment status api command.</p>
 */
@interface AMPaymentStatusRequest : NSObject

/**
 * payment transaction id (RRN)
 */
@property (strong, nonatomic) NSNumber *transactionId;

@end
