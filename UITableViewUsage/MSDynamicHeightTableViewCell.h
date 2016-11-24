//
//  MSDynamicHeightTableViewCell.h
//  UITableViewUsage
//
//  Created by mesird on 24/11/2016.
//  Copyright © 2016 mesird. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSDynamicHeightTableViewCell : UITableViewCell

+ (CGFloat)heightWithModel:(NSString *)text;

/** text content*/
@property (nonatomic, copy) NSString *content;

@end
