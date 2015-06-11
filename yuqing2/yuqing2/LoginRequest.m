//
//  LoginRequest.m
//  yuqing2
//
//  Created by wangshun on 15/5/24.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "LoginRequest.h"

@implementation LoginRequest

/*!
 登录
 
 username  ( 用户名，必填)
 password  （密码，必填）
 */

- (void)login:(NSDictionary *)dic{
    
    self.type = LoginUrlTypeLogin;
    
    self.url = Login_Url;
    
    self.parametersDict = [NSMutableDictionary dictionaryWithDictionary:dic];
    
    [self addOperation];
    
    [self start];
}

/*!
 修改密码
 
 customer_id( 客户id，必填)
 password_old（旧密码，必填）
 password_new（新密码，必填）
 password_new_verify（新密码确认，必填）
 */

- (void)UpdatePassword:(NSDictionary*)dic{
    
    self.type = LoginUrlTypeUpdatePsd;
 
    self.url = Update_Password_Url;
    
    self.parametersDict = [NSMutableDictionary dictionaryWithDictionary:dic];
    
    [self.parametersDict setObject:@"" forKey:@"customer_id"];
    
    [self addOperation];
    
    [self start];
}

/*!
 申请账号
 
 name        (申请人姓名，必填)
 company     (申请人公司，必填)
 mobile      (申请人电话，必填)
 email       (申请人邮箱，必填)
 */
- (void)ApplyAccount:(NSDictionary*)dic{
    
    self.type = LoginUrlTypeApplyAccount;
    
    self.url = Apply_Account_Url;
    
    self.parametersDict = [NSMutableDictionary dictionaryWithDictionary:dic];
    
    [self addOperation];
    
    [self start];

}

/*!
 未登录列表
 */
- (void)unLoginList{
    
    self.type = LoginUrlTypeUnloginList;

    self.url = UnLogin_list_Url;
    
    [self addOperation];
    
    [self start];
}

@end
