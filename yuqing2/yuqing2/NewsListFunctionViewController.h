//
//  NewsListFunctionViewController.h
//  yuqing2
//
//  Created by wangshun on 15/5/25.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "BaseViewController.h"

#import "LoginRequest.h"

@interface NewsListFunctionViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,MyRequestDelegate>
{
    LoginRequest* login_NewList_Request;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (strong,nonatomic) NSMutableArray* listArr;

@end
