//
//  AMURLSessionAPIImplementation.h
//  
//
//  Created by Юрий Воскресенский on 24.08.15.
//
//

#import <Foundation/Foundation.h>
#import "AMAPIClient.h"

/**
 * <p>Implementation of ApiClient interface</p>
 */
@interface AMURLSessionAPIImplementation : NSObject <AMAPIClient>

/** 
 * <p> Readonly property for current task to support possible cancellation </p>
 */
@property (strong, readonly, nonatomic) NSURLSessionDataTask *currentTask;

- (instancetype)initWithURLSessionConfiguration:(NSURLSessionConfiguration *)configuration NS_DESIGNATED_INITIALIZER;

@end
