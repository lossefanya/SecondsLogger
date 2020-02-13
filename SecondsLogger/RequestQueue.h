//
//  RequestQueue.h
//  SecondsLogger
//
//  Created by Yeongweon Park on 11.02.20.
//  Copyright © 2020 young1park. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *const SecondsLoggerQueueKey;

@protocol RequestQueueProtocol <NSObject>

- (void)enqueue:(NSString *)seconds;

@end

@protocol NetworkServiceProtocol;
@interface RequestQueue : NSObject <RequestQueueProtocol>

@property (nonatomic) NSUserDefaults *userDefaults;
@property (nonatomic) NSObject<NetworkServiceProtocol> *networkService;

- (instancetype)initWithUserDefaults:(NSUserDefaults *)userDefaults networkService:(NSObject<NetworkServiceProtocol> *)networkService;
//- (void)enqueue:(NSString *)seconds;

@end

NS_ASSUME_NONNULL_END
