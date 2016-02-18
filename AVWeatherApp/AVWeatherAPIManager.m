//
//  AVWeatherAPIManager.m
//  AVWeatherApp
//
//  Created by Ayuna Vogel on 2/18/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//
#import <AFNetworking/AFNetworking.h>

#import "AVWeatherAPIManager.h"

@implementation AVWeatherAPIManager

+ (void) getWeatherData:(void(^)(id response, NSError *error))handler {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
   
    [manager GET:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/40.759863,%20-73.920546" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSLog(@"JSON: %@", responseObject);
    
    } failure:^(NSURLSessionTask *operation, NSError *error) {
    
        NSLog(@"Error: %@", error);
    
    }];
    
    // https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/40.759863,%20-73.920546
    
    
    
}

@end
