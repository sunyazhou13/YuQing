//
//  LoginUrl.h
//  yuqing2
//
//  Created by wangshun on 15/5/22.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#ifndef yuqing2_LoginUrl_h
#define yuqing2_LoginUrl_h

/*
 
   1.登录接口
   2.修改密码
   3.申请接口
 
 */

/*
 登录接口
 
 URL：http://api-mobile.horizoom.cc/public/api.customer_login.php
 
 请求方式: POST
 
 参数： 
 username  ( 用户名，必填)
 
 password  （密码，必填）
 
 结果：
 1、[{"message":"用户名或密码为空！","success":"false"}]
 2、[{"message":"没有该用户！","success":"false"}]
 3、[{"message":"密码错误！","success":"false"}]
 4、[{"message":"对不起，您不可登陆，请联系管理员！","success":"false"}]
 5、[{"message":"登陆成功！","success":"true","customer_id":"客户id","username":"用户名","realname":"用户全名"}]*/

#define Login_Url @"http://api-mobile.horizoom.cc/public/api.customer_login.php"


/*
 修改密码接口：
 URL：http://api-mobile.horizoom.cc/public/api.customer_password_update_submit.php
 请求方式:POST
 参数： 
 customer_id( 客户id，必填)
 password_old（旧密码，必填）
 password_new（新密码，必填）
 password_new_verify（新密码确认，必填）
 
 结果：
 1、[{"message":"参数不全！","success":"false"}]
 2、[{"message":"两次输入的新密码校验不一致！","success":"false"}]
 3、[{"message":"没有该用户！","success":"false"}]
 4、[{"message":"原密码错误！","success":"false"}]
 5、[{"message":"修改成功！","success":"true","customer_id":"客户id","username":"用户名"}]
 */

#define Update_Password_Url @"http://api-mobile.horizoom.cc/public/api.customer_password_update_submit.php"

/*
 
 申请账号
 
 URL：http://api-mobile.horizoom.cc/private/xwyq_iphone/api.customer_apply_account.php
 
 请求方式: POST
 
 参数：  
 
 name    ( 申请人姓名，必填)
 
 company    （申请人公司，必填）
 
 mobile    (申请人电话，必填)
 
 email    (申请人邮箱，必填)
 
 结果：
 1、[{"message":"申请成功，我们会尽快与你联系！","success":"true"}]
 2、[{"message":"申请失败，请再试一试！","success":"true"}]
 
 */

#define Apply_Account_Url @"http://api-mobile.horizoom.cc/private/xwyq_iphone/api.customer_apply_account.php"


/*
 未登录列表
 
 请求方式:POST
 参数：
 
 function_id  （版块分类id，必填）
 
 page            (分页，可不填,不填则为第一页)
 
 */
#define UnLogin_list_Url @"http://api-mobile.horizoom.cc/private/xwyq_iphone/api.unlogin_push_content_list.php"



#endif
