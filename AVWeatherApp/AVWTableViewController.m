//
//  AVWTableViewController.m
//  AVWeatherApp
//
//  Created by Ayuna Vogel on 2/15/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//
#import <AFNetworking/AFNetworking.h>

#import "AVWTableViewController.h"
#import "AVCustomTableViewCell.h"
#import "AVWeatherObject.h"
#import "AVWDetailViewController.h"

#define ForecastIoAPIKey @"8040fc5b15adaaafabbe7de9c3ff5458"


@interface AVWTableViewController ()

@property (nonatomic) NSMutableArray *weatherArray;

@end


@implementation AVWTableViewController

#pragma mark - API Data setup

- (void)fetchAPIData {
    
    self.weatherArray = [[NSMutableArray alloc]init];
    
    // https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/40.759863,%20-73.920546
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/40.759863,%20-73.920546"
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
             //        NSLog(@"JSON: %@", responseObject);
        
             NSArray *results = responseObject[@"daily"][@"data"];
             
             for (NSDictionary *result in results) {
                 
                 AVWeatherObject *weatherObject = [[AVWeatherObject alloc]init];
                 
                 weatherObject.icon = result[@"icon"];
                 weatherObject.summary = result[@"summary"];
                 weatherObject.temperatureMax = [result[@"temperatureMax"] doubleValue];
                 weatherObject.temperatureMin = [result[@"temperatureMin"] doubleValue];
                 
                 
                 // ?
                 weatherObject.chanceOfRain = [NSString stringWithFormat:@"%.0f%%", [result[@"precipProbability"] doubleValue]];  // ?
                 weatherObject.humidity = [NSString stringWithFormat:@"%.2f%%", [result [@"humidity"]doubleValue]];
                 weatherObject.windSpeed = [NSString stringWithFormat:@"%0.2f% mph", [result[@"windSpeed"] doubleValue]];
                 
                 
                 // to get the day of the week string for the label in the table view cell
                 NSNumber *time = [result objectForKey:@"time"];
                 NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:[time doubleValue]];
                 NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                 [dateFormatter setDateFormat:@"EEEE"];
                 NSString *day = [dateFormatter stringFromDate:date];
                 weatherObject.day = day;
                 
                 [self.weatherArray addObject:weatherObject];
             }
             
             [self.tableView reloadData];
             
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"Error: %@", error);
         }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // register nib for the custom table view cell
    UINib *nib = [UINib nibWithNibName:@"AVCustomTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"CellIdentifier"];
  
    [self setupNavigationBarUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [self fetchAPIData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - setup Navigation Bar UI

- (void)setupNavigationBarUI {

    self.navigationItem.title = @"Awesome Weather App!";
    
    // change the navBar title color to orange http://stackoverflow.com/questions/599405/iphone-navigation-bar-title-text-color
    
    [self.navigationController.navigationBar setTitleTextAttributes: @{NSForegroundColorAttributeName:[UIColor orangeColor]}];
 
    // change the back button color to orange
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weatherArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AVCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    
    AVWeatherObject *weatherObject = [self.weatherArray objectAtIndex:indexPath.row];
    
    cell.dayOfTheWeekLabel.text = weatherObject.day;
    cell.weatherImageIcon.image = [UIImage imageNamed:weatherObject.icon];
    cell.temperatureLabel.text = [NSString stringWithFormat:@"%.0f - %.0f", weatherObject.temperatureMax, weatherObject.temperatureMin];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"DetailVCSegueId" sender:nil];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    // segue destination VC
    
    AVWDetailViewController *detailVC = segue.destinationViewController;

    NSIndexPath *ip = [self.tableView indexPathForSelectedRow];

    // Pass the selected object to the new view controller.

    AVWeatherObject *weatherObject = [self.weatherArray objectAtIndex:ip.row];
    
    detailVC.weatherObject = weatherObject;
}

@end
