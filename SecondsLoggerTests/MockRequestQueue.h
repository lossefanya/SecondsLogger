//
//  MockRequestQueue.h
//  SecondsLoggerTests
//
//  Created by Yeongweon Park on 13.02.20.
//  Copyright © 2020 young1park. All rights reserved.
//

#import "RequestQueue.h"

NS_ASSUME_NONNULL_BEGIN

@interface MockRequestQueue : NSObject <RequestQueueProtocol>

@property (copy, nonatomic) NSString *currentValue;

@end

NS_ASSUME_NONNULL_END
