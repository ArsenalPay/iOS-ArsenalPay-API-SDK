//
//  AMPaymentStatusResponse.h
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "AMAbstractResponse.h"


/**
 * <p>AMPaymentStatusResponse is needed for getting result of check payment status api command</p>
 */
@interface AMPaymentStatusResponse : AMAbstractResponse

/**
 * Payment date
 */
@property (strong, nonatomic) NSDate *dateTime;

@end
