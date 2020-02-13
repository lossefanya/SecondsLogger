//
//  MockRequestQueue.m
//  SecondsLoggerTests
//
//  Created by Yeongweon Park on 13.02.20.
//  Copyright © 2020 young1park. All rights reserved.
//

#import "MockRequestQueue.h"

@implementation MockRequestQueue

- (void)enqueue:(NSString *)seconds {
  self.currentValue = seconds;
}

@end
