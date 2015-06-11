//
//  NewsUrl.h
//  yuqing2
//
//  Created by wangshun on 15/6/5.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#ifndef yuqing2_NewsUrl_h
#define yuqing2_NewsUrl_h

/*!
 主列表(已登录)
 
 customer_id   （客户id,必填）
 */
#define MainNewsListUrl @"http://api-mobile.horizoom.cc/private/xwyq_iphone/api.customer_card_push_content_list.php"


/*
  新闻详情
 
 参数：
 
 customer_id  （客户id,必填）

 news_id（内容id,必填，取自列表接口返回json中的news_id字段）
 
*/
#define NewsDetailUrl @"http://api-mobile.horizoom.cc/private/xwyq_iphone/api.customer_push_content_detail.php"

#endif
