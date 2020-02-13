//
//  RequestQueue.m
//  SecondsLogger
//
//  Created by Yeongweon Park on 11.02.20.
//  Copyright © 2020 young1park. All rights reserved.
//

#import "RequestQueue.h"
#import "NetworkService.h"

NS_ASSUME_NONNULL_BEGIN

NSString *const SecondsLoggerQueueKey = @"SecondsLoggerQueueKey";

@interface RequestQueue ()

@property (copy, nonatomic) NSString *previousValue;
@property (nonatomic) NSMutableArray *queue;
@property (nonatomic) BOOL isWaiting;

@end

@implementation RequestQueue

- (instancetype)initWithUserDefaults:(NSUserDefaults *)userDefaults networkService:(NetworkService *)networkService {
  self = [super init];
  if (self) {
    self.userDefaults = userDefaults;
    self.networkService = networkService;
    self.previousValue = @"";
    self.queue = NSMutableArray.array;
    [self dequeue];
  }

  return self;
}

- (void)enqueue:(NSString *)seconds {
  if ([seconds isEqualToString:self.previousValue]) {
    NSLog(@"%@", @"Only different value can be sent.");
    return;
  }
  self.previousValue = seconds;

  NSArray<NSString *> *array = (NSArray<NSString *> *)[self.userDefaults valueForKey:SecondsLoggerQueueKey];
  NSMutableArray<NSString *> *queue = [NSMutableArray<NSString *> arrayWithArray:array];
  [queue addObject:seconds];
  [self.userDefaults setValue:queue forKey:SecondsLoggerQueueKey];

  if (!self.isWaiting) {
    [self dequeue];
  }
}

- (void)dequeue {
  self.isWaiting = YES;
  NSArray<NSString *> *array = (NSArray<NSString *> *)[self.userDefaults valueForKey:SecondsLoggerQueueKey];
  if (!array) {
    self.isWaiting = NO;
    return;
  }

  NSMutableArray<NSString *> *queue = [NSMutableArray<NSString *> arrayWithArray:array];
  NSString *first = queue.firstObject;
  if (!first) {
    self.isWaiting = NO;
    return;
  }

  [queue removeObjectAtIndex:0];

  __weak typeof(self)weakSelf = self;
  [self.networkService logSecond:first callback:^(NSError * _Nullable error) {
    if (error) {
      NSLog(@"%@", error.localizedDescription);
    }
    [weakSelf.userDefaults setValue:queue forKey:SecondsLoggerQueueKey];
    weakSelf.isWaiting = NO;
    [weakSelf dequeue];
  }];
}

@end

NS_ASSUME_NONNULL_END
