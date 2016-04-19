//
//  LoveDetailViewController.m
//  petShow
//
//  Created by baturu on 16/4/18.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "LoveDetailViewController.h"
#import "Factory.h"
@interface LoveDetailViewController ()<UIWebViewDelegate>
@property(nonatomic,strong) UIWebView *webView;
@end

@implementation LoveDetailViewController


- (id)initWithURL:(NSURL *)url{
    if (self = [super init]) {
        self.url = url;
    }
    return self;
}
- (UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
        [_webView loadRequest:[NSURLRequest requestWithURL:_url]];
        _webView.delegate = self;
    }
    return _webView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"爱心详情";
    // Do any additional setup after loading the view.
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [Factory addBackItemToVC:self];
}
#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress]; //旋转提示
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self hideProgress];
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
