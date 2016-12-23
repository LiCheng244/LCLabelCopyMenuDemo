//
//  ViewController.m
//  点击控件实现复制粘贴
//
//  Created by LiCheng on 2016/12/23.
//  Copyright © 2016年 LiCheng. All rights reserved.
//
#import "LCLabel.h"
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadHTMLString:@"<div style=\"color:red;\">这是一个WebView控件</div>" baseURL:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
