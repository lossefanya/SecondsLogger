//
//  NetworkService.m
//  SecondsLogger
//
//  Created by Yeongweon Park on 11.02.20.
//  Copyright © 2020 young1park. All rights reserved.
//

#import "NetworkService.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NetworkService

- (void)logSecond:(NSString *)second callback:(void (^)(NSError * _Nullable error))callback {
  NSError *parsingError;
  NSDictionary *param = [NSDictionary dictionaryWithObject:second forKey:@"seconds"];
  NSData *jsonData = [NSJSONSerialization dataWithJSONObject:param options:NSJSONWritingPrettyPrinted error:&parsingError];
  if (parsingError) {
    callback(parsingError);
    return;
  }

  NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
  NSData *requestData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];

  NSURL *url = [NSURL URLWithString:@"https://jsonplaceholder.typicode.com/posts"];
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
  [request setHTTPMethod:@"POST"];
  [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
  [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
  [request setHTTPBody:requestData];

  NSURLSessionTask *task = [NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error) {
      callback(error);
      return;
    }

    NSError *parsingError = nil;
    id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parsingError];
    if (parsingError) {
      callback(parsingError);
    } else {
      NSLog(@"%@", object);
      callback(nil);
    }
  }];
  [task resume];
}

@end

NS_ASSUME_NONNULL_END
