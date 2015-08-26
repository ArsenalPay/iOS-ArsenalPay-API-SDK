//
//  AMConstants.m
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "AMConstants.h"

NSString *const AMGETHTTPRequestMethod = @"GET";
NSString *const AMPOSTHTTPRequestMethod = @"POST";
NSString *const AMBaseURLString = @"https://arsenalpay.ru/";
NSString *const AMInitPayMK = @"init_pay_mk";
NSString *const AMServerDateFormat = @"yyyy-MM-dd hh:mm:ss";

NSString *const AMFrameworkErrorDomain = @"com.am.framework.domain";

NSInteger mapStringToErrorCode(NSString *string)
{
    NSInteger valueToReturn = AMUnknownAPIError;
    if ([string isEqualToString:@"ERROR"])
    {
        valueToReturn = AMUnknownAPIError;
    }
    else if ([string isEqualToString:@"ERR_ACCESS"])
    {
        valueToReturn = AMUnknownAPIServerError;
    }
    else if ([string isEqualToString:@"ERR_AMOUNT"])
    {
        valueToReturn = AMInvalidAmountError;
    }
    else if ([string isEqualToString:@"ERR_CURRENCY"])
    {
        valueToReturn = AMInvalidCurrencyError;
    }
    else if ([string isEqualToString:@"ERR_DATEFORMAT"])
    {
        valueToReturn = AMInvalidDateFormatError;
    }
    else if ([string isEqualToString:@"ERR_FUNCTION"])
    {
        valueToReturn = AMInvalidFunctionOrPostBodyError;
    }
    else if ([string isEqualToString:@"ERR_NODB"])
    {
        valueToReturn = AMInvalidDBError;
    }
    else if ([string isEqualToString:@"ERR_PHONE"])
    {
        valueToReturn = AMInvalidPhoneNumberError;
    }
    else if ([string isEqualToString:@"ERR_SIGN"])
    {
        valueToReturn = AMInvalidSignError;
    }
    else if ([string isEqualToString:@"NO_ANSWER"])
    {
        valueToReturn = AMUnconfirmedPaymentError;
    }
    else if ([string isEqualToString:@"OK_ANSWER"])
    {
        valueToReturn = AMSendPaymentRequestError;
    }
    return valueToReturn;
}