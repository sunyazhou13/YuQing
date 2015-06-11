//
//  NewsRequest.h
//  yuqing2
//
//  Created by wangshun on 15/6/5.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "MyRequest.h"

typedef NS_ENUM(NSUInteger, NewsUrlType) {
    NewsUrlTypeNormal = 0,
    NewsUrlTypeMainList,
    NewsUrlTypeNewsDetail
};

@interface NewsRequest : MyRequest

@property (nonatomic,assign) NewsUrlType type;

- (void)getMainNewsList;

- (void)getNewsDetail:(NSString*)newsid;

@end
