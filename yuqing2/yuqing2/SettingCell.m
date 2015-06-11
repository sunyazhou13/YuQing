//
//  SettingCell.m
//  yuqing2
//
//  Created by wangshun on 15/6/9.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "SettingCell.h"

@implementation SettingCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

-(void)setContent:(NSDictionary *)dict{
    
    [_img setImage:[UIImage imageNamed:[dict objectForKey:@"img"]]];
    
    [_titleLabel setText:[dict objectForKey:@"title"]];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
