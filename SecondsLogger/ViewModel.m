//
//  ViewModel.m
//  SecondsLogger
//
//  Created by Yeongweon Park on 11.02.20.
//  Copyright © 2020 young1park. All rights reserved.
//

#import "ViewModel.h"
#import "RequestQueue.h"

NS_ASSUME_NONNULL_BEGIN

@implementation ViewModel

- (instancetype)initWithRequestQueue:(RequestQueue *)requestQueue {
  self = [super init];
  if (self) {
    self.requestQueue = requestQueue;
  }

  return self;
}

- (void)logSecond {
  NSInteger seconds = [NSCalendar.currentCalendar component:NSCalendarUnitSecond fromDate:[NSDate date]];
  [self.requestQueue enqueue:[NSString stringWithFormat:@"%ld", seconds]];
}

@end

NS_ASSUME_NONNULL_END
