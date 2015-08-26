//
//  AMPaymentStatusResponse.m
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "AMPaymentStatusResponse.h"
#import "NSDictionary+ContainsKey.h"
#import "AMConstants.h"

@implementation AMPaymentStatusResponse

+ (instancetype)fromXML:(NSDictionary *)xml error:(NSError *__autoreleasing *)error
{
    AMPaymentStatusResponse *response = [super fromXML:xml error:error];
    if (!error)
    {
        if ([xml containsKey:@"datetime"])
        {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateFormat = AMServerDateFormat;
            NSString *dateTime = [xml objectForKey:@"datetime"];
            NSDate *date = [dateFormatter dateFromString:dateTime];
            response.dateTime = date;
        }
    }
    return response;
}

- (NSString *)description
{
    NSString *superString = [super description];
    return [NSString stringWithFormat:@"%@ dateTime: %@", superString, self.dateTime];
}

@end
