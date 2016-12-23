//
//  BaseViewController.m
//  点击控件实现复制粘贴
//
//  Created by LiCheng on 2016/12/23.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "BaseViewController.h"
#import "TableViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tableViewClick:(id)sender {
    
    TableViewController *tableViewVC = [[TableViewController alloc] init];
    tableViewVC.title = @"tableView 中使用";
    [self.navigationController pushViewController:tableViewVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
