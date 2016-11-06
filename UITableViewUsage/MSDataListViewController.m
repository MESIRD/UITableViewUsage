//
//  MSDataListViewController.m
//  UITableViewUsage
//
//  Created by mesird on 06/11/2016.
//  Copyright © 2016 mesird. All rights reserved.
//

#import "MSDataListViewController.h"

@interface MSDataListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation MSDataListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Data List";
    
    _items = [NSMutableArray array];
    [_items addObject:@"John Applesed"];
    [_items addObject:@"Kate Bell"];
    [_items addObject:@"Anna Haro"];
    [_items addObject:@"Daniel Higgins Jr."];
    [_items addObject:@"David Taylor"];
    [_items addObject:@"Hank M. Zarkoff"];
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(_editTableView)];
    self.navigationItem.rightBarButtonItem = editButton;
    
    _tableView.allowsMultipleSelection = YES;
    _tableView.allowsMultipleSelectionDuringEditing = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_editTableView {
    
    [_tableView beginUpdates];
    if (_tableView.editing) {
        _tableView.editing = NO;
    } else {
        _tableView.editing = YES;
    }
    [_tableView endUpdates];
}

#pragma mark - table view delegate & data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DataListCell"];
    
    // any additional configuration
    cell.textLabel.text = _items[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 45.0f;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *removeAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Remove" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"Removed!");
    }];
    
    __weak typeof(self) weakSelf = self;
    UITableViewRowAction *foldAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Fold" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [weakSelf _editTableView];
    }];
    
    return @[foldAction, removeAction];
}

@end
