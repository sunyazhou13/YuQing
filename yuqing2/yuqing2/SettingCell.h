//
//  SettingCell.h
//  yuqing2
//
//  Created by wangshun on 15/6/9.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *img;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)setContent:(NSDictionary*)dict;

@end
