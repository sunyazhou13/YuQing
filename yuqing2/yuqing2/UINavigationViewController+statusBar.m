//
//  UINavigationViewController.m
//  ESPC-M-HD
//
//  Created by wangshun on 15/3/22.
//  Copyright (c) 2015年 wangtiansoft. All rights reserved.
//

#import "UINavigationViewController+statusBar.h"

@implementation UINavigationController(statusBar)

-(UIViewController *)childViewControllerForStatusBarStyle
{
    return self.topViewController;
}

@end
