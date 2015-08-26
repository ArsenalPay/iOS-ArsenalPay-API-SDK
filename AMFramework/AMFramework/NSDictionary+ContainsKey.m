//
//  NSDictionary+ContainsKey.m
//  UserLoadTest
//
//  Created by Юрий Воскресенский on 18.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "NSDictionary+ContainsKey.h"

@implementation NSDictionary (ContainsKey)

- (BOOL)containsKey:(NSString *)key
{
    BOOL retVal = NO;
    NSArray *allKeys = [self allKeys];
    retVal = [allKeys containsObject:key];
    return retVal;
}

@end
