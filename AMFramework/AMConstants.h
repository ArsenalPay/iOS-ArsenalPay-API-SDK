//
//  AMConstants.h
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXTERN NSString *const AMGETHTTPRequestMethod;
FOUNDATION_EXTERN NSString *const AMPOSTHTTPRequestMethod;
FOUNDATION_EXTERN NSString *const AMBaseURLString;
FOUNDATION_EXTERN NSString *const AMInitPayMK;
FOUNDATION_EXTERN NSString *const AMServerDateFormat;

#define AM_ERROR_KEY(code)                    [NSString stringWithFormat:@"%d", code]
#define AM_ERROR_LOCALIZED_DESCRIPTION(code)  NSLocalizedStringFromTable(AM_ERROR_KEY(code), @"AMErrors", nil)

/**
 * <p>Multiple payment sources including wallets and other payment technologies<p/>
 *
 * <p>Feel free to add more and more!</p>
 */
typedef NS_ENUM(NSUInteger, AMMoneySource) {
    AMMoneySourceMobile,
    AMMoneySourceCard,
    AMMoneySourceWebMoney,
    AMMoneySourceMobiMoney,
    AMMoneySourcePlatBox,
    AMMoneySourcePayPal
};

FOUNDATION_EXPORT NSString *const AMFrameworkErrorDomain;

enum {
    AMUnknownAPIError = 1000,
    AMUnknownAPIServerError,
    AMInvalidAmountError,
    AMInvalidCurrencyError,
    AMInvalidDateFormatError,
    AMInvalidFunctionOrPostBodyError,
    AMInvalidDBError,
    AMInvalidPhoneNumberError,
    AMInvalidSignError,
    AMUnconfirmedPaymentError,
    AMSendPaymentRequestError
};

NSInteger mapStringToErrorCode(NSString *string);
