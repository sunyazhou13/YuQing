//
//  MainNewsViewController.h
//  yuqing2
//
//  Created by wangshun on 15/5/27.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "BaseViewController.h"

#import "NewsRequest.h"

#import "MainView.h"

#import "MenuView.h"

@interface MainNewsViewController : BaseViewController<UIScrollViewDelegate,MyRequestDelegate,MainViewDelegate,MenuDelegate>
{
    NewsRequest* mainListRequest;
    
    NSMutableArray* _dataArray;
    
    MainView* mainView;
    
    MenuView* menuView;
    
}
@property (weak, nonatomic) IBOutlet UIImageView *bgImgView;

@property (nonatomic,strong) UIScrollView *bgScrollView;

@property (weak, nonatomic) IBOutlet UIButton *moreBtn;

- (IBAction)moreClick:(id)sender;

@end
