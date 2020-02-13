//
//  RequestQueue.h
//  SecondsLogger
//
//  Created by Yeongweon Park on 11.02.20.
//  Copyright © 2020 young1park. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RequestQueueProtocol <NSObject>

- (void)enqueue:(NSString *)seconds;

@end

@class NetworkService;
@interface RequestQueue : NSObject <RequestQueueProtocol>

@property (nonatomic) NSUserDefaults *userDefaults;
@property (nonatomic) NetworkService *networkService;

- (instancetype)initWithUserDefaults:(NSUserDefaults *)userDefaults networkService:(NetworkService *)networkService;
//- (void)enqueue:(NSString *)seconds;

@end

NS_ASSUME_NONNULL_END
