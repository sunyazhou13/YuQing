//
//  MyRequest.h
//  yuqing2
//
//  Created by wangshun on 15/5/22.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworking.h"

#import "UrlDocument.h"

@protocol MyRequestDelegate;

@interface MyRequest : NSObject
{
    AFHTTPRequestOperation* operation;
}
@property (nonatomic,strong)NSURLRequest* postRequest;
@property (nonatomic,strong)NSString* url;
@property (nonatomic,strong)NSMutableDictionary* parametersDict;
@property (nonatomic,strong)NSMutableArray* resultArr;
@property (nonatomic,strong)id data;
@property (nonatomic,assign)id <MyRequestDelegate> delegate;

- (instancetype)initWithDelegate:(id <MyRequestDelegate>)delegate;

- (void)addOperation;

- (void)start;

@end


@protocol MyRequestDelegate <NSObject>

- (void)MyRequestFinished:(MyRequest*)req;

- (void)MyRequestFailed:(MyRequest*)req Error:(NSError*)error;

@end
