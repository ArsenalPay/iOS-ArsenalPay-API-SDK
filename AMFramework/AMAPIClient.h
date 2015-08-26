//
//  AMAPIClient.h
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMAPICommand.h"

typedef void(^AMAPIClientCompletion)(NSUInteger statusCode, NSData *response, NSError *error);

/**
 *  <p>ApiClient interface is need for communications with server of ArsenalPay API.</p>
 *
 *  Implementation can be different wrappers for http clients.
 *  Feel free to add your favorite http client or use our choice.
 */
@protocol AMAPIClient <NSObject>

/**
 * Execute api command and nothing else
 */
- (void)executeCommand:(AMAPICommand *)command completion:(AMAPIClientCompletion)completion;

@end

