//
//  MenuView.m
//  yuqing2
//
//  Created by wangshun on 15/6/9.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "MenuView.h"

#define topHeight 10

@implementation MenuView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIView* view = [[UIView alloc] initWithFrame:self.bounds];
        
        //设置圆角边框
        
        view.layer.cornerRadius = 8;
        
        view.layer.masksToBounds = YES;
        
        [view setBackgroundColor:[UIColor whiteColor]];
        
        view.alpha = 0.6;
        
        [self addSubview:view];
        
        [self configButtons];
        
        self.backgroundColor = [UIColor clearColor];
        
    }
    
    return self;
}


- (void)configButtons{
    
    
    
    for (int i = 0; i< 4; i++) {
        
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setFrame:CGRectMake(0, i*((self.bounds.size.height-topHeight-topHeight)/4)+topHeight, self.bounds.size.width, (self.bounds.size.height-topHeight-topHeight)/4)];
        
        [btn setTitle:@"舆情预警" forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
    }
}

- (void)click:(UIButton*)b{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(menuClick:)]) {
        [self.delegate performSelector:@selector(menuClick:) withObject:b];
    }
}



@end
