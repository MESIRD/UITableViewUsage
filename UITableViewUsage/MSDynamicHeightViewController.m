//
//  MSDynamicHeightViewController.m
//  UITableViewUsage
//
//  Created by mesird on 24/11/2016.
//  Copyright © 2016 mesird. All rights reserved.
//

#import "MSDynamicHeightViewController.h"

#import "MSDynamicHeightTableViewCell.h"
#import "MSDefaultDynamicHeightTableViewCell.h"

@interface MSDynamicHeightViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *feeds;

@end

@implementation MSDynamicHeightViewController

static NSString *const kReuseIdCustomDynamicHeightCell  = @"CustomDynamicHeightCell";
static NSString *const kReuseIdDefaultDynamicHeightCell = @"DefaultDynamicHeightCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    
    _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    _tableView.estimatedRowHeight  = 100.0f;
    
    // register cell
    [_tableView registerClass:MSDynamicHeightTableViewCell.class forCellReuseIdentifier:kReuseIdCustomDynamicHeightCell];
    
    _feeds = @[@"The HTML importer should not be called from a background thread (that is, the options dictionary includes NSDocumentTypeDocumentAttribute with a value of NSHTMLTextDocumentType). It will try to synchronize with the main thread, fail, and time out. Calling it from the main thread works (but can still time out if the HTML contains references to external resources, which should be avoided at all costs). The HTML import mechanism is meant for implementing something like markdown (that is, text styles, colors, and so on), not for general HTML import.",
               @"Document attributes for interpreting the document contents. NSDocumentTypeDocumentAttribute, NSCharacterEncodingDocumentAttribute, and NSDefaultAttributesDocumentAttribute are supported option keys. If not specified, the method examines the data to attempt to determine the appropriate attributes.",
               @"You may use the methods described in this class extension from secondary threads in your app and not just from the main thread. However, if you use any of the methods that support an NSStringDrawingContext object, you must not share contexts across threads or dispatch queues.",
               @"By default, strings are drawn using the native coordinate system of iOS, where content is drawn down and to the right from the specified origin point. Whenever you are positioning string content, you should keep this orientation in mind and use the upper-left corner of the string’s bounding box as the origin point for drawing.",
               @"The UIKit framework adds methods to NSAttributedString to support the drawing of styled strings and to compute the size and metrics of a string prior to drawing. None of these methods affects the contents of the object itself, only how it is drawn on screen.",
               @"Short Text",
               @" ",
               @"A required dictionary specifying the document attributes. The dictionary contains values from Document Types and must at least contain NSDocumentTypeDocumentAttribute.",
               @"Available in iOS 6.0 and later.",
               @"Use the image glyph bounds (instead of the typographic bounds) when computing layout.\nAvailable in iOS 6.0 and later."];
}

#pragma mark - table view delegate & data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _feeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        MSDefaultDynamicHeightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdDefaultDynamicHeightCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.content        = _feeds[indexPath.row];
        return cell;
    } else {
        MSDynamicHeightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdCustomDynamicHeightCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.content        = _feeds[indexPath.row];
        return cell;
    }
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return UITableViewAutomaticDimension;
    } else {
        return [MSDynamicHeightTableViewCell heightWithModel:_feeds[indexPath.row]];
    }
    return 0;
}

@end
