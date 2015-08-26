//
//  AMAPICommand.m
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "AMAPICommand.h"
#import "AMConstants.h"

@interface AMAPICommand()

@property (copy, readwrite, nonatomic) NSString *baseURLString;
@property (copy, readwrite, nonatomic) NSURLRequest *URLRequest;
@property (copy, readwrite, nonatomic) NSString *httpMethod;
@property (copy, readwrite, nonatomic) NSDictionary *parameters;

@end

@implementation AMAPICommand

- (instancetype)init
{
    NSException *exception = [NSException exceptionWithName:@"AMInvalidInitializerException" reason:@"Use initWithBaseURLString:httpMethod:parameters: selector to init the object!" userInfo:nil];
    @throw exception;
    return nil;
}

- (instancetype)initWithBaseURLString:(NSString *)baseURLString httpMethod:(NSString *)httpMethod parameters:(NSDictionary *)parameters
{
    if (self = [super init])
    {
        NSParameterAssert(baseURLString);
        NSParameterAssert(httpMethod);
        self.baseURLString = baseURLString;
        self.httpMethod = httpMethod;
        self.parameters = parameters;
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:self.baseURLString]];
        NSLog(@"httpMethod: %@", httpMethod);
        if (![httpMethod isEqualToString:AMGETHTTPRequestMethod] && ![httpMethod isEqualToString:AMPOSTHTTPRequestMethod])
        {
            NSException *exception = [NSException exceptionWithName:@"AMInvalidHTTPMethodException" reason:@"Use AMGETHTTPRequest & AMPOSTHTTPRequest to init the httpMethod!" userInfo:nil];
            @throw exception;
            return nil;
        }
        if (parameters)
        {
            NSArray *parametersKeys = [parameters allKeys];
            NSMutableString *mutableString = [[NSMutableString alloc] init];
            for (NSString *key in parametersKeys)
            {
                [mutableString appendString:[NSString stringWithFormat:@"%@=%@", key, [parameters objectForKey:key]]];
                if (![key isEqualToString:[parametersKeys lastObject]])
                {
                    [mutableString appendString:@"&"];
                }
            }
            if ([httpMethod isEqualToString:AMGETHTTPRequestMethod])
            {
                NSString *lastChar = [baseURLString substringFromIndex:[baseURLString length] - 1];
                if (![lastChar isEqualToString:@"?"]) self.baseURLString = [NSString stringWithFormat:@"%@%@", baseURLString, @"?"];
                request.URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", self.baseURLString, mutableString]];
            }
            else if ([httpMethod isEqualToString:AMPOSTHTTPRequestMethod])
            {
                NSString *lastChar = [baseURLString substringFromIndex:[baseURLString length] - 1];
                if (![lastChar isEqualToString:@"/"]) request.URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", self.baseURLString, @"/"]];
                [request setHTTPBody:[mutableString dataUsingEncoding:NSUTF8StringEncoding]];
                [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            }
        }
        request.HTTPMethod = httpMethod;
        self.URLRequest = request;
    }
    return self;
}

@end
