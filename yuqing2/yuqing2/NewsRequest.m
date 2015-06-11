//
//  NewsRequest.m
//  yuqing2
//
//  Created by wangshun on 15/6/5.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "NewsRequest.h"

@implementation NewsRequest

/*!
 主列表(已登录)
 
 customer_id   （客户id,必填）
 */

- (void)getMainNewsList{
    
    self.type = NewsUrlTypeMainList;
    
    self.url = MainNewsListUrl;

    self.parametersDict = [NSMutableDictionary dictionaryWithDictionary:@{@"customer_id":[[NSUserDefaults standardUserDefaults] objectForKey:UserID]}];
    
    [self addOperation];
    
    [self start];
}


- (void)getNewsDetail:(NSString*)newsid{
    
    self.type = NewsUrlTypeNewsDetail;
    
    self.url = NewsDetailUrl;
    
    self.parametersDict = [NSMutableDictionary dictionaryWithDictionary:@{@"news_id":newsid,@"customer_id":[[NSUserDefaults standardUserDefaults] objectForKey:UserID]}];
    
    [self addOperation];
    
    [self start];
}

@end
