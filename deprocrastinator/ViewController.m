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
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property NSMutableArray *arrayItemColor;
@property BOOL editOn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = @[@"Do dis:", @"And this:", @"Maybe this:", @"Probably this ss well:"].mutableCopy;
    self.arrayItemColor = @[[UIColor blackColor],[UIColor greenColor],[UIColor blackColor],[UIColor redColor]].mutableCopy;

    self.editOn = NO;
    
    
    
}
- (IBAction)onEditButonPressed:(UIBarButtonItem *)sender {
    
    if (self.editOn) {
        sender.title = @"Edit";
        self.editOn = NO;
    } else {
        sender.title = @"Done";
        self.editOn = YES;
    }
    
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
    
    
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [self.arrayItemColor replaceObjectAtIndex:indexPath.row withObject:[UIColor greenColor]];
    
    [self.tableView reloadData];
    
    NSLog(@"%@", self.array);
    NSLog(@"%@", self.arrayItemColor);
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.editOn) {
        return YES;
    }
    return NO;

}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"CommitEditingStyle");
}


- (IBAction)addButtonPressed:(UIButton *)sender {
    
    [self.array addObject:[NSString stringWithFormat:@"%@", self.textField.text]];
    [self.arrayItemColor addObject:[UIColor blackColor]];
    
    [self.tableView reloadData];
    [self.textField setText:@""];
    [self.textField resignFirstResponder];
    
    NSLog(@"%@", self.array);
    NSLog(@"%@", self.arrayItemColor);
    

    
    
    
    
}

@end
