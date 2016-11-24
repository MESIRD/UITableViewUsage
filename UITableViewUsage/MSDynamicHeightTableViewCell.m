//
//  MSDynamicHeightTableViewCell.m
//  UITableViewUsage
//
//  Created by mesird on 24/11/2016.
//  Copyright © 2016 mesird. All rights reserved.
//

#import "MSDynamicHeightTableViewCell.h"

#import "NSString+Size.h"

@interface MSDynamicHeightTableViewCell ()

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation MSDynamicHeightTableViewCell

+ (CGFloat)heightWithModel:(NSString *)text {
    
    if (text.length == 0) {
        return 45.0f;
    }
    
    return 10.0f + [text heightForWidth:SCREEN_WIDTH - 30.0f withFontSize:14.0f] + 10.0f;
}

- (void)setContent:(NSString *)content {
    _content = [content copy];
    
    if (_contentLabel) {
        _contentLabel.text = _content;
        CGRect labelFrame = _contentLabel.frame;
        labelFrame.size.height = [_content heightForWidth:CGRectGetWidth(labelFrame) withFontSize:14.0f];
        _contentLabel.frame = labelFrame;
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 10.0f, SCREEN_WIDTH - 30.0f, 50.0f)];
        _contentLabel.textColor = [UIColor darkGrayColor];
        _contentLabel.font = [UIFont systemFontOfSize:14.0f];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.numberOfLines = 0;
        [self addSubview:_contentLabel];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
