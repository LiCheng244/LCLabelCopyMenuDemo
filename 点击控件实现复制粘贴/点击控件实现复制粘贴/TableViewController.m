//
//  TableViewController.m
//  点击控件实现复制粘贴
//
//  Created by LiCheng on 2016/12/23.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "TableViewController.h"
#import "LCTableViewCell.h"

@interface TableViewController ()

@property (nonatomic, strong) LCTableViewCell *selectCell;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[LCTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行", indexPath.row+1];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 当menu显示时，点击不同的cell时为什么会切换 ？
    // menu的显示依赖于第一响应者，当点击另外的cell时，当前cell取消第一响应者状态，menu自动消失
    UIMenuController *menu = [UIMenuController sharedMenuController];
    

    // 防止多次点击
    if (menu.isMenuVisible) { // 多次点击
        
        [menu setMenuVisible:NO animated:YES];
        
    }else{ // 第一次点击
        
        LCTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        self.selectCell = cell;
        [cell becomeFirstResponder];
        
        // 自定义菜单
        UIMenuItem *item0 = [[UIMenuItem alloc] initWithTitle:@"分享" action:@selector(share:)];
        UIMenuItem *item1 = [[UIMenuItem alloc] initWithTitle:@"评论" action:@selector(comment:)];
        UIMenuItem *item2 = [[UIMenuItem alloc] initWithTitle:@"点赞" action:@selector(praise:)];
        menu.menuItems = @[item0, item1, item2];
        
        // 设置菜单弹出位置
        CGRect rect = CGRectMake(0, cell.frame.size.height / 2, cell.frame.size.width, cell.frame.size.height);
        [menu setTargetRect:rect inView:cell];
        
        // 显示
        [menu setMenuVisible:YES animated:YES];
    }
}

- (void)share:(UIMenuController *)menu
{
    NSLog(@"%@",self.selectCell.textLabel.text);
}

- (void)comment:(UIMenuController *)menu
{
    NSLog(@"%@",self.selectCell.textLabel.text);

}

- (void)praise:(UIMenuController *)menu
{
    NSLog(@"%@",self.selectCell.textLabel.text);
}

/**
 *  cell 滚动时 ， 将菜单隐藏
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    UIMenuController * menu = [UIMenuController sharedMenuController];
    [menu setMenuVisible:NO animated:YES];
}

@end
