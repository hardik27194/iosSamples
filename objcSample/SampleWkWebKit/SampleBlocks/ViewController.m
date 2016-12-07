//
//  ViewController.m
//  SampleBlocks
//
//  Created by 島田武史 on 2014/11/11.
//  Copyright (c) 2014年 jp.co.sakura.charorin. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController () <WKNavigationDelegate>

@property (strong, nonatomic) WKWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.2];


//    self.webView.navigationDelegate = self;
    
    // WKWebView インスタンスの生成
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(10, 100, 300, 400)];
    [self.view addSubview:self.webView];
    
    
}



-(void)viewDidAppear:(BOOL)animated {

    // 初回画面表示時にIntialURLで指定した Web ページを読み込む
    NSString* InitialURL = @"http://www.yahoo.co.jp";
    NSURL *url = [NSURL URLWithString:InitialURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
}



@end
