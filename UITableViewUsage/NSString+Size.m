//
//  NSString+Size.m
//  UITableViewUsage
//
//  Created by mesird on 24/11/2016.
//  Copyright © 2016 mesird. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGFloat)heightForWidth:(CGFloat)width withFontSize:(CGFloat)fontSize {
    return [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size.height;
}

@end
