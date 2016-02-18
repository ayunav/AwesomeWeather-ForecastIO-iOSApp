//
//  AVWeatherAPIManager.h
//  AVWeatherApp
//
//  Created by Ayuna Vogel on 2/18/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVWeatherAPIManager : NSObject

+ (void)getWeatherData:(void(^)(id response, NSError *error))handler;

@end
