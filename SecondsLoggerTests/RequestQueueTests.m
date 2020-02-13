//
//  RequestQueueTests.m
//  SecondsLoggerTests
//
//  Created by Yeongweon Park on 11.02.20.
//  Copyright © 2020 young1park. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MockNetworkService.h"
#import "RequestQueue.h"

@interface RequestQueueTests : XCTestCase

@property (nonatomic, nullable) NSUserDefaults *userDefaults;
@property (nonatomic, nullable) MockNetworkService *mockNetworkService;
@property (nonatomic, nullable) RequestQueue *requestQueue;

@end

@implementation RequestQueueTests

- (void)setUp {
  [super setUp];
  self.userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"test"];
  self.mockNetworkService = [MockNetworkService new];
  self.requestQueue = [[RequestQueue alloc] initWithUserDefaults:self.userDefaults
                                                  networkService:self.mockNetworkService];
}

- (void)tearDown {
  [super tearDown];
  self.userDefaults = nil;
  self.mockNetworkService = nil;
  self.requestQueue = nil;
}

- (void)testExample {
  NSString *testValue = @"77";
  [self.requestQueue enqueue:testValue];
  NSArray<NSString *> *array = (NSArray<NSString *> *)[self.userDefaults valueForKey:SecondsLoggerQueueKey];
  XCTAssertNotNil(array);
  BOOL isEqual = [array.firstObject isEqualToString:testValue];
  XCTAssertTrue(isEqual);
  XCTestExpectation *expectation = [[XCTestExpectation alloc] initWithDescription:@"The value has sent and then dequeued."];
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [expectation fulfill];
    NSArray<NSString *> *array = (NSArray<NSString *> *)[self.userDefaults valueForKey:SecondsLoggerQueueKey];
    XCTAssertEqual(array.count, 0);
  });
  [self waitForExpectations:@[expectation] timeout:1];
}

@end
