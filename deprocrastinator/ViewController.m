//
//  ViewController.m
//  deprocrastinator
//
//  Created by Ernie Barojas on 5/31/16.
//  Copyright © 2016 Ernie Barojas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];




}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.textLabel.text = [NSString stringWithFormat:@"TEST"];
    
    return cell;


}


- (IBAction)addButtonPressed:(id)sender {
    
    
    
    
}

@end
