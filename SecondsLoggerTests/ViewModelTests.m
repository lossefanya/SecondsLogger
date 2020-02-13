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

@property (nonatomic) MockRequestQueue *mockRequestQueue;
@property (nonatomic) ViewModel *viewModel;

@end

@implementation ViewModelTests

- (void)setUp {
  self.mockRequestQueue = [[MockRequestQueue alloc] init];
  self.viewModel = [[ViewModel alloc] initWithRequestQueue:self.mockRequestQueue];
}

- (void)tearDown {
  self.mockRequestQueue = nil;
  self.viewModel = nil;
}

- (void)testExample {
  NSInteger seconds = [NSCalendar.currentCalendar component:NSCalendarUnitSecond fromDate:[NSDate date]];
  [self.viewModel logSecond];
  BOOL isEqual = [self.mockRequestQueue.currentValue isEqualToString:[NSString stringWithFormat:@"%ld", seconds]];
  XCTAssertTrue(isEqual);
}

@end
