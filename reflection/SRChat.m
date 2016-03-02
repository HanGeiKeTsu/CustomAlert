//
//  SRChat.m
//  reflection
//
//  Created by iOS Dev on 16/2/25.
//  Copyright © 2016年 iOS Dev. All rights reserved.
//

#import "SRChat.h"

@interface SRChat () <UIWebViewDelegate>

@property (nonatomic, strong)UIWebView *webView;

@end

@implementation SRChat


-(void)viewDidLoad
{
    self.view.backgroundColor = [UIColor brownColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(barAxion:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(barAcion:)];
    self.title = @"投票";
    [self createWebView];
}
-(void)excute
{
    NSLog(@"chat_excute  %@,%@",self.name,self.age);
}
-(void)barAcion:(id)sender
{
    [self.webView goBack];
}
-(void)barAxion:(id)sender
{
    [self.webView reload];
}
- (void)barAcionback:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)createWebView
{
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.suber360.com/activities/festival.html"]]];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (webView.canGoBack == YES) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(barAcion:)];
    } else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(barAcionback:)];
    }
}

@end
