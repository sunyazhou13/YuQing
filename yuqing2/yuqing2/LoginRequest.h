//
//  LoginRequest.h
//  yuqing2
//
//  Created by wangshun on 15/5/24.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "MyRequest.h"

typedef NS_ENUM(NSUInteger, LoginUrlType) {
    LoginUrlTypeNormal = 0,
    LoginUrlTypeLogin,
    LoginUrlTypeUpdatePsd,
    LoginUrlTypeApplyAccount,
    LoginUrlTypeUnloginList
};

@interface LoginRequest : MyRequest

@property (nonatomic,assign) LoginUrlType type;

- (void)login:(NSDictionary*)dic;

- (void)UpdatePassword:(NSDictionary*)dic;

- (void)ApplyAccount:(NSDictionary*)dic;

- (void)unLoginList;


@end
