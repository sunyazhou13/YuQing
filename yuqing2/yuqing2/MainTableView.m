//
//  MainTableView.m
//  yuqing2
//
//  Created by wangshun on 15/6/5.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "MainTableView.h"

#import "NewsListFunctionCell.h"

@implementation MainTableView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _news_list = [[NSMutableArray alloc] initWithCapacity:0];
        
        UIView* view = [[UIView alloc] initWithFrame:self.bounds];
        
        [view setBackgroundColor:[UIColor whiteColor]];
        
        [view setAlpha:0.4];

        //设置圆角边框
        
        view.layer.cornerRadius = 8;
        
        view.layer.masksToBounds = YES;
        
        [self addSubview:view];
        
        view = [[UIView alloc] initWithFrame:CGRectMake(10, 50, self.bounds.size.width-20, 1)];
        
        [view setBackgroundColor:[UIColor lightGrayColor]];
        
        [self addSubview:view];
        
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.bounds.size.width-20, 35)];
        
        [_titleLabel setFont:[UIFont systemFontOfSize:22]];
        
        [_titleLabel setText:@"板块标题"];
        
        [_titleLabel setTextAlignment:1];
        
        [_titleLabel setTextColor:[UIColor blackColor]];
        
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        
        [self addSubview:_titleLabel];
        
        [self createTableView];
        
    }
    return self;
}

- (void)createTableView{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 50, self.bounds.size.width-20, self.bounds.size.height-50) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView setBackgroundColor:[UIColor clearColor]];
    
    _tableView.showsVerticalScrollIndicator = NO;
    
    [self addSubview:_tableView];
    
    UIView* view =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    _tableView.tableFooterView = view;
    
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _tableView.frame.size.width, 20)];
    
    _tableView.tableHeaderView = view;
    
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NewsListFunctionCell* cell = (NewsListFunctionCell*)[tableView cellForRowAtIndexPath:indexPath];
    
    NSString* news_id = [cell.info objectForKey:@"news_id"];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedCell:)]) {
        [self.delegate didSelectedCell:news_id];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString* str_id = @"NewList";
    
    NewsListFunctionCell* cell = [tableView dequeueReusableCellWithIdentifier:str_id];
    
    if (cell == nil) {
        
        cell = [[NewsListFunctionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str_id Frame:tableView.frame];
        
        [cell setBackgroundColor:[UIColor clearColor]];
    }
    
    NSDictionary* dict = [_news_list objectAtIndex:indexPath.row];
    
    [cell setContent:dict WithFrame:tableView.frame];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _news_list.count;
}

-(void)reloadData:(NSDictionary *)dict{
    
    _function_id = [dict objectForKey:@"function"];
    
    _name  = [dict objectForKey:@"name"];
    
    NSArray* arr=  [dict objectForKey:@"news_list"];
    
    [_news_list addObjectsFromArray:arr];
    
    [_titleLabel setText:_name];
    
    [_tableView reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
