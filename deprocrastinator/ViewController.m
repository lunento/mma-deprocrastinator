//
//  ViewController.m
//  deprocrastinator
//
//  Created by Ernie Barojas on 5/31/16.
//  Copyright © 2016 Ernie Barojas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property NSMutableArray *array;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *arrayItemColor;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = @[@"Do dis:", @"And this:", @"Maybe this:", @"Probably this ss well:"].mutableCopy;
    self.arrayItemColor = @[[UIColor blackColor],[UIColor greenColor],[UIColor blackColor],[UIColor redColor]].mutableCopy;



}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.array.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];

    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.array objectAtIndex:indexPath.row]];
    cell.textLabel.textColor = self.arrayItemColor[indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"did select");
    
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.highlightedTextColor = [UIColor greenColor];

}


- (IBAction)addButtonPressed:(id)sender {
    [self.array addObject:[NSString stringWithFormat:@"%@", self.textField.text]];
    
    [self.tableView reloadData];
    [self.textField setText:@""];
    [self.textField resignFirstResponder];
    
    
    
    
}

@end
