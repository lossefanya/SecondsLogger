//
//  ViewModel.h
//  SecondsLogger
//
//  Created by Yeongweon Park on 11.02.20.
//  Copyright © 2020 young1park. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RequestQueueProtocol;
@interface ViewModel : NSObject

@property (nonatomic) NSObject<RequestQueueProtocol> *requestQueue;

- (instancetype)initWithRequestQueue:(NSObject<RequestQueueProtocol> *)requestQueue;
- (void)logSecond;

@end

NS_ASSUME_NONNULL_END
