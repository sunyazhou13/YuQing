//
//  NewsListFunctionCell.m
//  yuqing2
//
//  Created by wangshun on 15/5/25.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "NewsListFunctionCell.h"

@implementation NewsListFunctionCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    
    _titleLabel = [[VerticallyAlignedLabel alloc] init];
    
    [_titleLabel setFrame:_tLabel.frame];
    
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    
    [_titleLabel setVerticalAlignment:VerticalAlignmentTop];
    
    _titleLabel.numberOfLines = 0;
    
    [_titleLabel setFont:[UIFont systemFontOfSize:14]];
    
    [self.contentView addSubview:_titleLabel];
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier Frame:(CGRect)frame{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _rreadStaturImg = [[UIImageView alloc] initWithFrame:CGRectMake(29, 8, 10, 10)];
        
        [_rreadStaturImg setImage:[UIImage imageNamed:@"未读"]];
        
        _readStaturImg = _rreadStaturImg;
        
        [self addSubview:_readStaturImg];
        
        _ttLabel = [[UILabel alloc] initWithFrame:CGRectMake(29+8+10, 4, frame.size.width-29-29-8-10, 35)];
        
        _tLabel = _ttLabel;
        
        [self addSubview:_ttLabel];
        
        _titleLabel = [[VerticallyAlignedLabel alloc] init];
        
        [_titleLabel setFrame:_tLabel.frame];
        
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        
        [_titleLabel setVerticalAlignment:VerticalAlignmentTop];
        
        _titleLabel.numberOfLines = 0;
        
        [_titleLabel setFont:[UIFont systemFontOfSize:14]];
        
        [self.contentView addSubview:_titleLabel];
        
    }
    
    return self;
}


- (void)setContent:(NSDictionary*)dic WithFrame:(CGRect)frame{
    
    self.info = dic;
    
    //CGFloat x = frame.size.width-self.bounds.size.width;
    
    [_titleLabel setFrame:CGRectMake(_tLabel.frame.origin.x, _tLabel.frame.origin.y, frame.size.width-29-_tLabel.frame.origin.x, _tLabel.frame.size.height)];
    
    [_titleLabel setText:[_info objectForKey:@"title"]];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
