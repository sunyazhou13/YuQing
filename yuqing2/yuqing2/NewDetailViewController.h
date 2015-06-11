//
//  NewDetailViewController.h
//  yuqing2
//
//  Created by wangshun on 15/6/6.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "BaseViewController.h"
#import "NewsRequest.h"

@interface NewDetailViewController : BaseViewController<MyRequestDelegate>
{
    NewsRequest* request;
}

@property (weak, nonatomic) IBOutlet UIView *frameView;

@property (strong, nonatomic)  UILabel *subLabel;

@property (strong, nonatomic)  UILabel *titleLabel;

@property (strong, nonatomic)  UIView *headView;

@property (strong, nonatomic)  UIWebView *webView;

@property (nonatomic,strong) NSString* news_id;

@property (nonatomic,strong) NSString* content;

@property (nonatomic,strong) NSString* summary;

@property (nonatomic,strong) NSString* news_title;

@property (nonatomic,strong) NSString* is_secret;

@property (nonatomic,strong) NSString* type;

@end
