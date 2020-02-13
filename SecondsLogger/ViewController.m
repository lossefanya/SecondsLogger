//
//  ViewController.m
//  SecondsLogger
//
//  Created by Yeongweon Park on 11.02.20.
//  Copyright © 2020 young1park. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"
#import "NetworkService.h"
#import "RequestQueue.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewController ()

@property (nonatomic) ViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initialize];
}

- (void)initialize {
  NetworkService *networkService = [[NetworkService alloc] init];
  RequestQueue *requestQueue = [[RequestQueue alloc] initWithUserDefaults:NSUserDefaults.standardUserDefaults
                                                           networkService:networkService];
  ViewModel *viewModel = [[ViewModel alloc] initWithRequestQueue:requestQueue];
  self.viewModel = viewModel;
}

- (IBAction)didTapButton {
  [self.viewModel logSecond];
}


@end

NS_ASSUME_NONNULL_END
