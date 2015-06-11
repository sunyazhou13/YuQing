//
//  MyRequest.m
//  yuqing2
//
//  Created by wangshun on 15/5/22.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "MyRequest.h"

#import "JSONKit.h"

@implementation MyRequest

- (instancetype)initWithDelegate:(id <MyRequestDelegate>)delegate{
    if (self = [super init]) {
      
        self.delegate = delegate;
        
        self.resultArr = [[NSMutableArray alloc] initWithCapacity:0];

    }
    
    return self;
}

- (void)addOperation{
    
    NSError* error = nil;

    NSLog(@"url:%@",_url);
    
    _postRequest = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:_url parameters:_parametersDict error:&error];
    
    operation = [[AFHTTPRequestOperation alloc] initWithRequest:_postRequest];

    __weak MyRequest* weakSelf = self;
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        weakSelf.resultArr = [responseObject mutableObjectFromJSONData];
        
        if (weakSelf.resultArr.count) {
        
            NSDictionary* dict = [weakSelf.resultArr objectAtIndex:0];
            
            if ([[dict objectForKey:@"success"] isEqualToString:@"true"]) {
                if (weakSelf.delegate) {
                    if ([weakSelf.delegate respondsToSelector:@selector(MyRequestFinished:)]) {
                        [weakSelf.delegate performSelector:@selector(MyRequestFinished:) withObject:weakSelf];
                        return;
                    }
                }
            }
        }
        
        if (weakSelf.delegate) {//有数据，失败
            if ([weakSelf.delegate respondsToSelector:@selector(MyRequestFailed:Error:)]) {
                [weakSelf.delegate performSelector:@selector(MyRequestFailed:Error:) withObject:weakSelf withObject:error];
                return;
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (weakSelf.delegate) {//无数据失败
            if ([weakSelf.delegate respondsToSelector:@selector(MyRequestFailed:Error:)]) {
                [weakSelf.delegate performSelector:@selector(MyRequestFailed:Error:) withObject:weakSelf.resultArr withObject:error];
                return;
            }
        }
        
    }];
}

-(void)start{
    
    [operation start];
    
}

@end
