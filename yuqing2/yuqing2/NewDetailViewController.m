//
//  NewDetailViewController.m
//  yuqing2
//
//  Created by wangshun on 15/6/6.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "NewDetailViewController.h"

@implementation NewDetailViewController

-(void)awakeFromNib{
    [super awakeFromNib];
    
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self configViews];
    
    if (!request) {
        request = [[NewsRequest alloc] initWithDelegate:self];
    }
    
    [request getNewsDetail:self.news_id];
}

#pragma mark - MyRequest Delegate

- (void)MyRequestFinished:(MyRequest *)req{
    
    if (req.resultArr) {

        //NSLog(@"req.resultArr:%@",req.resultArr);
        
        NSDictionary* dict = [req.resultArr objectAtIndex:0];
        
        if (dict) {

            _news_title = [dict objectForKey:@"title"];
            
            _summary = [dict objectForKey:@"summary"];
            
            _type = [dict objectForKey:@"type"];
            
            _content = [dict objectForKey:@"content"];
            
            _is_secret = [dict objectForKey:@"is_secret"];
            
            NSLog(@"_content:%@",_content);

        }
        
        [self refreshContentData];
    }
}

-(void)MyRequestFailed:(MyRequest *)req Error:(NSError *)error{
    
}


- (void)refreshContentData{
    
    NSLog(@"title:%@",_news_title);

    CGRect rect = [_news_title boundingRectWithSize:CGSizeMake(self.view.frame.size.width-30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[_titleLabel font]} context:nil];
    
    [_titleLabel setFrame:CGRectMake(_titleLabel.frame.origin.x, _titleLabel.frame.origin.y, _titleLabel.frame.size.width, rect.size.height)];
    
    [_titleLabel setText:_news_title];
    
    [_headView setFrame:CGRectMake(0, 0, self.view.bounds.size.width, rect.size.height+15+20+5)];
    
    UIView* view = [_headView viewWithTag:123321];
    
    [view setFrame:CGRectMake(5, _headView.frame.size.height-2, _headView.frame.size.width-10, 2)];
    
    [_subLabel setText:_summary];
    
    [_webView setFrame:CGRectMake(0, _headView.frame.size.height, _headView.frame.size.width, self.view.bounds.size.height-_headView.bounds.size.height)];
    
    [_webView loadHTMLString:_content baseURL:nil];
}

- (void)configViews{
   
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 65)];
    
    [self.view addSubview:_headView];
    
    _subLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, self.view.frame.size.width-30, 15)];
    [_subLabel setFont:[UIFont systemFontOfSize:10]];
    [_subLabel setTextColor:[UIColor lightGrayColor]];
    [_subLabel setBackgroundColor:[UIColor clearColor]];
    [_headView addSubview:_subLabel];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20+15, self.view.frame.size.width-30, 20)];
    [_titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [_titleLabel setTextColor:[UIColor blackColor]];
    [_titleLabel setNumberOfLines:0];
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    [_headView addSubview:_titleLabel];
    
    UIView* bottomLine = [[UIView alloc] initWithFrame:CGRectMake(5, _headView.frame.size.height-2, _headView.frame.size.width-10, 2)];
    [bottomLine setBackgroundColor:RGB(152,115,28)];
    
    bottomLine.tag = 123321;
    
    [_headView addSubview:bottomLine];
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, _headView.frame.size.height, _headView.frame.size.width, self.view.bounds.size.height-_headView.bounds.size.height)];
    
    [_webView setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:_webView];
}

@end
