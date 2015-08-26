//
//  AMMerchantCredentials.h
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * <p>Credentials of merchant.</p>
 *
 * <p>Assumed that these data were obtained via a secure protocol, confidential and is the primary identifier merchant
 * in information exchange with the payment center arsenal pay including all requests must be signed using this data</p>
 */
@interface AMMerchantCredentials : NSObject

@property (copy, nonatomic) NSString *merchantId;
@property (copy, nonatomic) NSString *secret;

@end
