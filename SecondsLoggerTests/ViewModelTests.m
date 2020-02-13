//
//  ViewModelTests.m
//  SecondsLoggerTests
//
//  Created by Yeongweon Park on 11.02.20.
//  Copyright © 2020 young1park. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewModel.h"
#import "MockRequestQueue.h"

@interface ViewModelTests : XCTestCase

@property (nonatomic, nullable) MockRequestQueue *mockRequestQueue;
@property (nonatomic, nullable) ViewModel *viewModel;

@end

@implementation ViewModelTests

- (void)setUp {
  [super setUp];
  self.mockRequestQueue = [MockRequestQueue new];
  self.viewModel = [[ViewModel alloc] initWithRequestQueue:self.mockRequestQueue];
}

- (void)tearDown {
  [super tearDown];
  self.mockRequestQueue = nil;
  self.viewModel = nil;
}

- (void)testLogSecond {
  NSInteger seconds = [NSCalendar.currentCalendar component:NSCalendarUnitSecond fromDate:[NSDate date]];
  [self.viewModel logSecond];
  BOOL isEqual = [self.mockRequestQueue.currentValue isEqualToString:[NSString stringWithFormat:@"%ld", seconds]];
  XCTAssertTrue(isEqual);
}

@end
