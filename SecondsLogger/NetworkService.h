//
//  NetworkService.h
//  SecondsLogger
//
//  Created by Yeongweon Park on 11.02.20.
//  Copyright © 2020 young1park. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkService : NSObject

- (void)logSecond:(NSString *)second callback:(void (^)(NSError * _Nullable error))callback;

@end

NS_ASSUME_NONNULL_END
