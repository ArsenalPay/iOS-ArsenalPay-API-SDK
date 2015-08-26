//
//  AMAbstractResponse.h
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * <p>AbstractResponse for all api commands.</p>
 *
 * <p>For different commands we need different responses.
 *
 * <p>Feel free to add new responses witch will extend this class.</p>
 */
@interface AMAbstractResponse : NSObject

/**
 * Payment transaction id or
 * RRN -- Acquirer Retrieval Reference Number
 */
@property (strong, nonatomic) NSNumber *transactionId;

/**
 * who was the payer?
 */
@property (strong, nonatomic) NSNumber *payerId;

/**
 * who was accept the payment in merchant application?
 */
@property (strong, nonatomic) NSNumber *recipientId;

/**
 * what was the amount of payment?
 */
@property (strong, nonatomic) NSNumber *amount;

/**
 * ArsenalPay status message
 */
@property (copy, nonatomic) NSString *status;

/**
 * Create object from xml
 */
+ (instancetype)fromXML:(NSDictionary *)xml error:(NSError **)error;

@end
