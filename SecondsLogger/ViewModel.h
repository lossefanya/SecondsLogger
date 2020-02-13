//
//  ViewModel.h
//  SecondsLogger
//
//  Created by Yeongweon Park on 11.02.20.
//  Copyright © 2020 young1park. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RequestQueue;
@interface ViewModel : NSObject

@property (nonatomic) RequestQueue *requestQueue;

- (instancetype)initWithRequestQueue:(RequestQueue *)requestQueue;
- (void)logSecond;

@end

NS_ASSUME_NONNULL_END
