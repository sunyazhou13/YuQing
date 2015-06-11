//
//  MenuView.h
//  yuqing2
//
//  Created by wangshun on 15/6/9.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuDelegate;

@interface MenuView : UIView
{
    
}

@property (nonatomic,strong) id <MenuDelegate>delegate;

-(instancetype)initWithFrame:(CGRect)frame;


@end

@protocol MenuDelegate <NSObject>

- (void)menuClick:(UIButton*)b;

@end
