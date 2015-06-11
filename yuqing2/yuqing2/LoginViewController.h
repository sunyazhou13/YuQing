//
//  LoginViewController.h
//  yuqing2
//
//  Created by wangshun on 15/5/17.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "BaseViewController.h"

#import "LoginRequest.h"

@interface LoginViewController : BaseViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,MyRequestDelegate>
{
    LoginRequest* login_Request;
}
@property (strong,nonatomic) NSMutableArray* listArr;

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *psdField;

@property (weak, nonatomic) IBOutlet UIView *bgView;//用来给scrollview撑起contentsize 并触发点击事件来关掉键盘

@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)loginClick:(id)sender;

@end
