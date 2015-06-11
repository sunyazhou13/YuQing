//
//  NewsListFunctionCell.h
//  yuqing2
//
//  Created by wangshun on 15/5/25.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VerticallyAlignedLabel.h"

@interface NewsListFunctionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *readStaturImg;

@property (weak, nonatomic) IBOutlet UILabel *tLabel;

@property (strong,nonatomic) VerticallyAlignedLabel* titleLabel;

@property (strong,nonatomic) NSDictionary* info;

@property (strong,nonatomic) UIImageView *rreadStaturImg;
@property (strong,nonatomic) UILabel *ttLabel;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier Frame:(CGRect)frame;

- (void)setContent:(NSDictionary*)dic WithFrame:(CGRect)frame;

@end
