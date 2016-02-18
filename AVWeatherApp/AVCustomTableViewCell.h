//
//  AVCustomTableViewCell.h
//  AVWeatherApp
//
//  Created by Ayuna Vogel on 2/18/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AVCustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dayOfTheWeekLabel;

@property (weak, nonatomic) IBOutlet UIImageView *weatherImageIcon;

@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

@end
