//
//  AMSecurityUtilities.h
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * <p>Simple SecurityUtils class for ArsenalPay API SDK.</p>
 */
@interface AMSecurityUtilities : NSObject

/**
 * Create signature for request values
 *
 * @param secret secret word
 * @param values values in strict order as described in PS API
 */
+ (NSString *)signatureWithSecret:(NSString *)secret values:(NSArray *)values;

@end
