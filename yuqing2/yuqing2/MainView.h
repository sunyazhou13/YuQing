//
//  MainView.h
//  yuqing2
//
//  Created by wangshun on 15/6/4.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableView.h"
@protocol MainViewDelegate;

@interface MainView : UIView<UIScrollViewDelegate,MainTableDelegate>
{
    NSMutableArray* _tableViewsArr;
    
    NSMutableArray* _datasArr;
    
    NSInteger currentPage;
    
    BOOL isFinal;
    
}
@property (nonatomic,strong) UIScrollView* bgScrollView;
@property (nonatomic,strong) UIPageControl* pageCtrl;
@property (nonatomic,assign) id <MainViewDelegate> delegate;

- (void)refreshData:(NSArray*)arr;

@end


@protocol MainViewDelegate <NSObject>

- (void)enterFunctinList;

- (void)enterNewDetail:(NSString*)news_id;

@end
