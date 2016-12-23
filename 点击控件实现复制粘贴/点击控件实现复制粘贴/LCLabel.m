//
//  LCLabel.m
//  点击控件实现复制粘贴
//
//  Created by LiCheng on 2016/12/23.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "LCLabel.h"

@implementation LCLabel


/**
 *  xib 和 代码 创建
 */
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}


/**
 *  初始化操作
 */
-(void)setup{
    
    // 打开用户交互， 添加手势
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick)];
    [self addGestureRecognizer:tap];
}

/**
 *  点击事件
 */
-(void)labelClick{
    
    //【1】. 成为第一响应者
    // 成为第一响应者后，会提供两个方法 becomeFirstResponder 和 canPerformAction
    // 同时告诉 UIMenuController 支持哪些操作， 操作如何处理
    [self becomeFirstResponder];
    
    //【2】. 创建 menu 控制器
    UIMenuController *menuMC = [UIMenuController sharedMenuController];
    // 设置弹出的 menu 的区域
    [menuMC setTargetRect:self.bounds inView:self];
    // 使 menu 可见
    [menuMC setMenuVisible:YES animated:YES];
    
}

#pragma mark - <第一响应者事件>
/**
 *  label 成为第一响应者
 */
-(BOOL)canBecomeFirstResponder{
    return YES;
}

/**
 *  label 能执行哪些操作（如: copy, paste）
 */
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    
    // label 支持的所有操作
    NSLog(@"%@", NSStringFromSelector(action));
    
    // 设置 label 支持的操作 （值为 yes ）
    if (action == @selector(copy:) || action == @selector(paste:) || action == @selector(cut:)) return YES;
    
    return NO;
}

#pragma mark - <重写 copy 等方法>
/**
 *  拷贝
 */
-(void)copy:(id)sender{
    // 将自己的文字复制到粘贴板
    UIPasteboard *board = [UIPasteboard generalPasteboard]; //UIPasteboard 粘贴板
    board.string = self.text;
}

/**
 *  剪切
 */
-(void)cut:(id)sender{
    
    // 将自己的文字拷贝粘贴板
    [self copy:sender];
    // 自身文字设置为空
    self.text = nil;
}

/**
 *  粘贴
 */
-(void)paste:(id)sender{
    
    // 将粘贴板的文字设置到自身
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    self.text = board.string;
}


/**
 *
  cut: 剪切
  copy: 拷贝
  select: 选择
  selectAll: 全选
  paste: 粘贴
  delete: 删除
  _promptForReplace: 替换
  _transliterateChinese: 简体繁体转换按钮
  _showTextStyleOptions: 文字风格
  _lookup:
  _define: 定义
  _addShortcut:
  _accessibilitySpeak:
  _accessibilitySpeakLanguageSelection: 语言选择
  _accessibilityPauseSpeaking: 停止发音
  _share: 分享
  makeTextWritingDirectionRightToLeft: 改变书写模式为从右向左
  makeTextWritingDirectionLeftToRight: 改变书写模式为从左向右
 */








@end
