//
//  MainTableView.h
//  yuqing2
//
//  Created by wangshun on 15/6/5.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MainTableDelegate;

@interface MainTableView : UIView<UITableViewDelegate,UITableViewDataSource>
{
    UILabel* _titleLabel;
    
    UITableView* _tableView;
}
@property (nonatomic,strong) id <MainTableDelegate> delegate;

//属性与接口返回字段一致
@property (nonatomic ,strong) NSString* function_id;//板块id

@property (nonatomic ,strong) NSString* name;//板块title

@property (nonatomic ,strong) NSMutableArray* news_list;//板块内容

- (void)reloadData:(NSDictionary*)dict;

@end

@protocol MainTableDelegate <NSObject>

- (void)didSelectedCell:(NSString*)news_id;

@end
