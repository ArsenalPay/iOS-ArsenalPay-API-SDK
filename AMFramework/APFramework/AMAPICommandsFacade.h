//
//  AMAPICommandsFacade.h
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMPaymentRequest.h"
#import "AMPaymentResponse.h"
#import "AMPaymentStatusRequest.h"
#import "AMPaymentStatusResponse.h"

typedef void(^AMPaymentRequestCompletion)(AMPaymentResponse *response, NSUInteger statusCode, NSError *error);

typedef void(^AMPaymentStatusRequestCompletion)(AMPaymentStatusResponse *response, NSUInteger statusCode, NSError *error);

/**
 * <p>ArsenalPay Server API facade for executing commands toward merchant.</p>
 */
@protocol AMAPICommandsFacade <NSObject>

/**
 * <p>Make a request for processing a payment toward merchant account</p>
 *
 * <b>This method is a composition of two parts:</b>
 * <ul>
 *     <li>payment request validation (checking account)</li>
 *     <li>process payment</li>
 * </ul>
 *
 * <p>
 *     <b>Take a note!</b>
 *     <span>
 *         Upon successful completion of this request you should first find out the status of payments
 *         and make sure that it has successfully performed using the method <b>checkPaymentStatus</b>
 *         (the default option) or we will send you a callback if you want
 *         then and only then charge money to account through the billing system of your application.
 *     </span>
 * </p>
 *
 * <b>Mobile payment:</b>
 * <p>After calling this method your client ('payerId' in request payment as phone number and payment source)
 * will get sms message and then if client send sms with confirmation code transfer actually be held.
 * User must confirm payment within a half-hour (30 minutes). In other cases payment will be refused.</p>
 *
 * @param request the request for payment AMPaymentRequest.
 * Assumed that you reliably get data for payment through your own application forms.
 */
- (void)requestPayment:(AMPaymentRequest *)request completion:(AMPaymentRequestCompletion)completion;

/**
 * <p>Make a request for checking of payment status.</p>
 */
- (void)checkPaymentStatus:(AMPaymentStatusRequest *)request completion:(AMPaymentStatusRequestCompletion)completion;

@end
