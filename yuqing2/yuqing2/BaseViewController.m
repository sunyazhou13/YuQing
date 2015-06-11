//
//  BaseViewController.m
//  yuqing2
//
//  Created by wangshun on 15/5/17.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    isLoading = NO;
}
//使用MBProgressHUD.h的方法  isDim是否需要暗影
- (void)showHUD:(NSString *)title isDim:(BOOL)isDim {
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:isDim] ;
    self.hud.labelText = title;
    //是否需要暗影遮盖 dim 暗淡的
    self.hud.dimBackground = isDim;
}

//使用MBProgressHUD.h的方法  isDim是否需要暗影
- (void)showHUD:(NSString *)title isDim:(BOOL)isDim withView:(UIView*)v{
    self.hud = [MBProgressHUD showHUDAddedTo:v animated:isDim];
    self.hud.labelText = title;
    //是否需要暗影遮盖 dim 暗淡的
    self.hud.dimBackground = isDim;
}

//使用MBProgressHUD.h的方法  isDim是否需要暗影
- (void)showHUD:(NSString *)title isDim:(BOOL)isDim afterDelay:(NSTimeInterval)delay{
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:isDim];
    self.hud.mode =MBProgressHUDModeText;
    [self.hud hide:YES afterDelay:delay];
    
    self.hud.labelText = title;
    //是否需要暗影遮盖 dim 暗淡的
    self.hud.dimBackground = isDim;
}

//加载完成是否隐藏
- (void)hideHUD {
    [self.hud hide:YES];
}
#pragma mark - didReceiveMemoryWarning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSString*)documentPath{
    
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

@end
