//
//  MainView.m
//  yuqing2
//
//  Created by wangshun on 15/6/4.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "MainView.h"

#define tableViewTag 4321

@implementation MainView


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {

        _tableViewsArr = [[NSMutableArray alloc] initWithCapacity:0];
        
        _datasArr = [[NSMutableArray alloc] initWithCapacity:0];
        
        [self createBgScrollView:self.bounds];
        
        currentPage = 0;
        isFinal = NO;
        
    }

    return self;
}

- (void)createBgScrollView:(CGRect)frame{
    
    _bgScrollView  = [[UIScrollView alloc] initWithFrame:frame];
    
    [_bgScrollView setDelegate:self];
    
    [_bgScrollView setPagingEnabled:YES];
    
    [_bgScrollView setBackgroundColor:[UIColor clearColor]];
    
    [_bgScrollView setShowsHorizontalScrollIndicator:NO];
    
    [self addSubview:_bgScrollView];
    
    [_bgScrollView setContentSize:CGSizeMake(self.bounds.size.width*1, self.bounds.size.height-160)];
    
    _pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, frame.size.height, frame.size.width, 50)];
    
    [self addSubview:_pageCtrl];
    
    _pageCtrl.currentPage = currentPage;
    
    _pageCtrl.numberOfPages = 0;
    
    [self createTableViews];
}

- (void)createTableViews{
    
    if (_datasArr.count ==0) {
        return;
    }
    
    for (int i =0; i<_datasArr.count; i++) {
        
        if (_tableViewsArr.count != 0) {
            
            if (_tableViewsArr.count <= i) {//如果数据比现有的table多
                
                MainTableView* mainTable  = [[MainTableView alloc] initWithFrame:CGRectMake(self.bounds.size.width*i+40, 20, self.bounds.size.width-80, self.bounds.size.height-40)];
                
                [mainTable setBackgroundColor:[UIColor clearColor]];
                
                mainTable.tag = tableViewTag+i;
                
                mainTable.delegate = self;
                
                [_bgScrollView addSubview:mainTable];
                
                [_tableViewsArr addObject:mainTable];
            }
        }
        else{
            MainTableView* mainTable  = [[MainTableView alloc] initWithFrame:CGRectMake(self.bounds.size.width*i+40, 20, self.bounds.size.width-80, self.bounds.size.height-40)];
        
            [mainTable setBackgroundColor:[UIColor clearColor]];
        
            mainTable.tag = tableViewTag+i;
            
            mainTable.delegate = self;
        
            [_bgScrollView addSubview:mainTable];
    
            [_tableViewsArr addObject:mainTable];
        }
    }
    
    [_bgScrollView setContentSize:CGSizeMake(self.bounds.size.width*_datasArr.count, self.bounds.size.height-160)];
    
    _pageCtrl.numberOfPages = _datasArr.count;
}

#pragma mark - refresh Data

- (void)refreshData:(NSArray *)arr{
    
    if (arr) {
       
        [_datasArr addObjectsFromArray:arr];
        
        [self createTableViews];
        
        for (int i = 0 ; i< _datasArr.count ;i++) {
            
            MainTableView* mainTableView = [_tableViewsArr objectAtIndex:i];
            
            NSDictionary* dict = [_datasArr objectAtIndex:i];
            
            [mainTableView reloadData:dict];
            
        }
    }
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    int page;
    
    page = (scrollView.contentOffset.x / self.bounds.size.width);
    
    currentPage = page;
    
    _pageCtrl.currentPage = currentPage;
    
    if (scrollView.contentOffset.x+scrollView.frame.size.width>scrollView.contentSize.width) {

        if (currentPage == _datasArr.count-1) {
            
            isFinal = YES;
        }
        else{
            isFinal = NO;
        }
    }
    else{
        if (currentPage < _datasArr.count-1) {
             isFinal = NO;
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (isFinal) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(enterFunctinList)]) {
            [self.delegate enterFunctinList];
        }
    }
}

#pragma mark - MainTableViewDelegate

- (void)didSelectedCell:(NSString *)news_id{
    if (self.delegate && [self.delegate respondsToSelector:@selector(enterNewDetail:)]) {
        [self.delegate enterNewDetail:news_id];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
