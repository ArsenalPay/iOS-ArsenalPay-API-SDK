//
//  NSDictionary+ContainsKey.h
//  UserLoadTest
//
//  Created by Юрий Воскресенский on 18.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ContainsKey)

- (BOOL)containsKey:(NSString *)key;

@end
