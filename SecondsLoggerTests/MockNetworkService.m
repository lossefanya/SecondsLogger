//
//  MockNetworkService.m
//  SecondsLoggerTests
//
//  Created by Yeongweon Park on 13.02.20.
//  Copyright © 2020 young1park. All rights reserved.
//

#import "MockNetworkService.h"

@implementation MockNetworkService

- (void)logSecond:(nonnull NSString *)second callback:(nonnull void (^)(NSError * _Nullable))callback {
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    callback(nil);
  });
}

@end
