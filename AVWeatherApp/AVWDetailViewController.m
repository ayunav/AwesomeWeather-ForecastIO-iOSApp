//
//  AVWDetailViewController.m
//  AVWeatherApp
//
//  Created by Ayuna Vogel on 2/15/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import "AVWDetailViewController.h"

@interface AVWDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;

@property (weak, nonatomic) IBOutlet UILabel *weatherSummaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *chanceOfRainLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windSpeedLabel;

@end

@implementation AVWDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.weatherIcon.image = [UIImage imageNamed:self.weatherObject.icon];
    self.weatherSummaryLabel.text = self.weatherObject.summary;
    self.chanceOfRainLabel.text = self.weatherObject.chanceOfRain;
    self.humidityLabel.text = self.weatherObject.humidity;
    self.windSpeedLabel.text = self.weatherObject.windSpeed;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
