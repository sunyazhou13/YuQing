//
//  VerticallyAlignedLabel.h
//  ddDemo
//
//  Created by DangDang on 11-4-6.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

//
//  VerticallyAlignedLabel.h
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum VerticalAlignment {
    VerticalAlignmentTop,
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface VerticallyAlignedLabel : UILabel

@property (nonatomic, assign) VerticalAlignment verticalAlignment;


@end