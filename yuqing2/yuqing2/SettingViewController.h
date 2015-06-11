//
//  SettingViewController.h
//  yuqing2
//
//  Created by wangshun on 15/6/9.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "BaseViewController.h"

@interface SettingViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray* _dataArray;
}
@end
