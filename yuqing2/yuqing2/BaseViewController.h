//
//  BaseViewController.h
//  yuqing2
//
//  Created by wangshun on 15/5/17.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MyRequest.h"

#import "MBProgressHUD.h"

#import "Function.h"

@interface BaseViewController : UIViewController
{
    BOOL isLoading;
}
@property (nonatomic,retain) MBProgressHUD* hud;

//使用MBProgressHUD.h的方法  isDim是否需要暗影
- (void)showHUD:(NSString *)title isDim:(BOOL)isDim;

//使用MBProgressHUD.h的方法  isDim是否需要暗影
- (void)showHUD:(NSString *)title isDim:(BOOL)isDim withView:(UIView*)v;

//自动消失
- (void)showHUD:(NSString *)title isDim:(BOOL)isDim afterDelay:(NSTimeInterval)delay;

//加载完成是否隐藏
- (void)hideHUD;

//documents 目录
- (NSString*)documentPath;

@end
