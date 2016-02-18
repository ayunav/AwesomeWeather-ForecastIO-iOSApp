//
//  AVWTableViewController.m
//  AVWeatherApp
//
//  Created by Ayuna Vogel on 2/15/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import "AVWTableViewController.h"
#import "AVCustomTableViewCell.h"
#import "AVWeatherAPIManager.h"

@interface AVWTableViewController ()

@end

@implementation AVWTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // register nib for the custom table view cell
    UINib *nib = [UINib nibWithNibName:@"AVCustomTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"CellIdentifier"];
  
    [self setupUI];
    
    [AVWeatherAPIManager getWeatherData:^(id response, NSError *error) {
        self.weekWeather = response[@"daily"][@"data"];
        NSLog(@"%@", response); 
    }];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setup UI 

- (void)setupUI {

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
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AVCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    
    cell.dayOfTheWeekLabel.text = @"Monday";
    //cell.weatherImageIcon.image = ;
    cell.temperatureLabel.text = @"24 - 56";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"DetailVCSegueId" sender:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
