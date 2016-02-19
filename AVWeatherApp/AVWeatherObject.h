//
//  AVWeatherObject.h
//  AVWeatherApp
//
//  Created by Ayuna Vogel on 2/18/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVWeatherObject : NSObject

// to be displayed in the Table VC 
@property (nonatomic) NSString *day;
@property (nonatomic) NSString *icon;
@property (nonatomic) double temperatureMax;
@property (nonatomic) double temperatureMin;

// to be displayed in the Detail VC
@property (nonatomic) NSString *summary;
@property (nonatomic) NSString *chanceOfRain;
@property (nonatomic) NSString *humidity;
@property (nonatomic) NSString *windSpeed;

@end
