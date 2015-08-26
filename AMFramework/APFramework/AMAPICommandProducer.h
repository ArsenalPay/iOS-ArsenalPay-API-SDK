//
//  AMAPICommandProducer.h
//  AMFramework
//
//  Created by Юрий Воскресенский on 24.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMAPICommand.h"

/**
 * <p>Protocol of producing API specific command (server api response)</p>
 *
 */
@protocol AMAPICommandProducer <NSObject>

- (AMAPICommand *)command;

@end
