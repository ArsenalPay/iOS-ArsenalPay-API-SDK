//
//  AMSecurityUtilities.m
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "AMSecurityUtilities.h"
#import "NSString+MD5String.h"

@implementation AMSecurityUtilities

+ (NSString *)signatureWithSecret:(NSString *)secret values:(NSArray *)values
{
    NSParameterAssert(secret);
    NSParameterAssert(values);
    NSAssert(values > 0, @"Values parameter can't be less then 0!");
    NSMutableString *mutableString = [[NSMutableString alloc] init];
    for (NSString *string in values)
    {
        [mutableString appendString:[string MD5String]];
    }
    [mutableString appendString:[secret MD5String]];
    NSString *testString = [mutableString MD5String];
    return testString;
}

@end
