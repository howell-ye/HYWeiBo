//
//  HYOAuthViewController.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/23.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYOAuthViewController.h"

#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"

#import "HYAccount.h"
#import "HYAccountTool.h"

#import "HYRootTool.h"

#define HYAuthorizeBaseUrl @"https://api.weibo.com/oauth2/authorize"
#define HYClient_id @"2389394849" //@"3098401846"
#define HYRedirect_uri @"http://www.baidu.com"
#define HYClient_secret @"03729d16a4cd277c7da26398f7a01282" //@"21d0d509fa64972f734fe6b90486f0ac"


@interface HYOAuthViewController ()<UIWebViewDelegate>

@end

@implementation HYOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webview = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webview];
    
    NSString *baseUrl = HYAuthorizeBaseUrl;
    NSString *client_id = HYClient_id;
    NSString *redirect_uri = HYRedirect_uri;
    
    NSString *urlStr = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",baseUrl,client_id,redirect_uri];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webview loadRequest:request];
    webview.delegate = self;
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showMessage:@"正在加载..."];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
    NSLog(@"授权页面加载失败");
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlStr = request.URL.absoluteString;
    NSLog(@"%@",urlStr);
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.length) {
        NSString *code = [urlStr substringFromIndex:range.location + range.length];
        [self accessTokenWithCode:code];
        return NO;
    }
    return YES;
}

-(void)accessTokenWithCode:(NSString *)code
{
    [HYAccountTool accountWithCode:code success:^{
        [HYRootTool chooseRootViewController:HYKeyWindow];
    } failure:^(NSError *error){
    
    }];
}
@end























