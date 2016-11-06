//
//  ViewController.m
//  UITableViewUsage
//
//  Created by mesird on 06/11/2016.
//  Copyright © 2016 mesird. All rights reserved.
//

#import "ViewController.h"

#import "MSDataListViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Catalog";
}



#pragma mark - table view delegate & data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomePageCell"];
    
    // any additional configuration
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"UITableView Basic Usage";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"UITableView Advanced Usage";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"Other Usages";
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        MSDataListViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MSDataListViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 1) {
        
    } else if (indexPath.row == 2) {
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 45.0f;
}



@end
