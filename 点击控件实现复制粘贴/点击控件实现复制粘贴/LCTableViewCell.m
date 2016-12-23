//
//  LCTableViewCell.m
//  点击控件实现复制粘贴
//
//  Created by LiCheng on 2016/12/23.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "LCTableViewCell.h"

@implementation LCTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(BOOL)canBecomeFirstResponder{
    return YES;
}

@end
