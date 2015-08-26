//
//  AMAbstractResponse.m
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "AMAbstractResponse.h"
#import "AMConstants.h"
#import "NSDictionary+ContainsKey.h"
@import ObjectiveC;

@implementation AMAbstractResponse

+ (instancetype)fromXML:(NSDictionary *)xml error:(NSError **)error
{
    AMAbstractResponse *response = [self new];
    
    if ([xml containsKey:@"status"]) response.status = [xml objectForKey:@"status"];
    
    if (![response.status isEqualToString:@"OK"] && ![response.status isEqualToString:@"OK_PAY"])
    {
        NSInteger code = mapStringToErrorCode(response.status);
        *error = [NSError errorWithDomain:AMFrameworkErrorDomain code:code userInfo:[NSDictionary dictionaryWithObjectsAndKeys: AM_ERROR_LOCALIZED_DESCRIPTION(code), NSLocalizedDescriptionKey, nil]];
        return nil;
    }
    
    if ([xml containsKey:@"account"]) response.payerId = [NSNumber numberWithLongLong:[[NSString stringWithFormat:@"%@", [xml objectForKey:@"account"]] longLongValue]];
    if ([xml containsKey:@"amount"]) response.amount = [NSNumber numberWithLongLong:[[NSString stringWithFormat:@"%@", [xml objectForKey:@"amount"]] longLongValue]];
    if ([xml containsKey:@"rrn"]) response.transactionId = [NSNumber numberWithLongLong:[[NSString stringWithFormat:@"%@", [xml objectForKey:@"rrn"]] longLongValue]];
    if ([xml containsKey:@"phone"]) response.recipientId = [NSNumber numberWithLongLong:[[NSString stringWithFormat:@"%@", [xml objectForKey:@"phone"]] longLongValue]];
    
    return response;
}

- (NSString *)description
{
    NSMutableString *mutableString = [NSMutableString new];
    if (self.transactionId) [mutableString appendString:[NSString stringWithFormat:@"TransactionId: %@ ", self.transactionId]];
    if (self.payerId) [mutableString appendString:[NSString stringWithFormat:@"payerId: %@ ", self.payerId]];
    if (self.recipientId) [mutableString appendString:[NSString stringWithFormat:@"recipientId: %@ ", self.recipientId]];
    if (self.amount) [mutableString appendString:[NSString stringWithFormat:@"amount: %@ ", self.amount]];
    if (self.status) [mutableString appendString:[NSString stringWithFormat:@"status: %@ ", self.status]];
    return [mutableString copy];
}

@end
