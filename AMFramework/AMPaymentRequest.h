//
//  AMPaymentRequest.h
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMConstants.h"

/**
 * <p> AMPaymentRequest is model of payment. Contains all needed data for processing payment. </p>
 */
@interface AMPaymentRequest : NSObject

/**
 * who will pay? Id in payment system ex phone number, card number and etc
 */
@property (strong, nonatomic) NSNumber *payerId;

/**
 * who will get charge in merchant application? Id in merchant system
 */
@property (strong, nonatomic) NSNumber *recipientId;

/**
 * what is the amount of charge? Restrictions are: from 10 to 15000 'RUB' now.
 */
@property (strong, nonatomic) NSNumber *amount;

/**
 * what is the currency type? ISO-4217
 */
@property (copy, nonatomic) NSString *currency;

/**
 * what is the source of charge?
 */
@property (nonatomic) AMMoneySource moneySource;

/** 
 * what is payment comment? (Optional) Ex "Gift from Santa."
 */
@property (copy, nonatomic) NSString *comment;

/**
 *  is it test payment?
 */
@property (nonatomic, getter=isTest) BOOL test;

@end
