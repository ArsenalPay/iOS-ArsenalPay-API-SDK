//
//  AMAPICommand.h
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 * <p>ApiCommand is the model of ArsenalPay Server API request.</p>
 */
@interface AMAPICommand : NSObject

/** URL request generated from passed parameters to initializer */
@property (copy, readonly, nonatomic) NSURLRequest *URLRequest;

/** Initializer for creating AMAPICommand object */
- (instancetype)initWithBaseURLString:(NSString *)baseURLString httpMethod:(NSString *)httpMethod parameters:(NSDictionary *)parameters;

@end
