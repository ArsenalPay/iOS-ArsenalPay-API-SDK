//
//  AMURLSessionAPIImplementation.m
//  
//
//  Created by Юрий Воскресенский on 24.08.15.
//
//

#import "AMURLSessionAPIImplementation.h"

@interface AMURLSessionAPIImplementation()

@property (strong, nonatomic) NSURLSession *session;

@property (strong, readwrite, nonatomic) NSURLSessionDataTask *currentTask;

@end

@implementation AMURLSessionAPIImplementation

- (instancetype)init
{
    return [self initWithURLSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
}

- (instancetype)initWithURLSessionConfiguration:(NSURLSessionConfiguration *)configuration
{
    if (self = [super init])
    {
        self.session = [NSURLSession sessionWithConfiguration:configuration];
    }
    return self;
}

- (void)executeCommand:(AMAPICommand *)command completion:(AMAPIClientCompletion)completion
{
    self.currentTask = [self.session dataTaskWithRequest:[command URLRequest] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
        if (completion) completion(urlResponse.statusCode, data, error);
    }];
    [self.currentTask resume];
}

@end
