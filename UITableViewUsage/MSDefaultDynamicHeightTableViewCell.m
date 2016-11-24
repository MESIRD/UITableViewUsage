//
//  MSDefaultDynamicHeightTableViewCell.m
//  UITableViewUsage
//
//  Created by mesird on 25/11/2016.
//  Copyright © 2016 mesird. All rights reserved.
//

#import "MSDefaultDynamicHeightTableViewCell.h"

@interface MSDefaultDynamicHeightTableViewCell () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation MSDefaultDynamicHeightTableViewCell

- (void)setContent:(NSString *)content {
    _content = [content copy];
    
    if (self.textView) {
        self.textView.text = _content;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Text View Delegate

- (void)textViewDidChange:(UITextView *)textView {
    
    CGRect bounds = textView.bounds;
    // 计算 text view 的高度
    CGSize maxSize = CGSizeMake(bounds.size.width, CGFLOAT_MAX);
    CGSize newSize = [textView sizeThatFits:maxSize];
    bounds.size = newSize;
    textView.bounds = bounds;
    // 让 table view 重新计算高度
    UITableView *tableView = [self tableView];
    [tableView beginUpdates];
    [tableView endUpdates];
}

- (UITableView *)tableView {
    
    UIView *tableView = self.superview;
    while (![tableView isKindOfClass:[UITableView class]] && tableView) {
        tableView = tableView.superview;
    }
    return (UITableView *)tableView;
}

@end
