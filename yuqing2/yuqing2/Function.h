//
//  Function.h
//  yuqing2
//
//  Created by wangshun on 15/5/27.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

typedef enum
{
    iphone4s=0,
    iphone5s=1,
    iphone6 =2,
    iphone6p=3
} DeviceType;

@interface Function : NSObject

+ (BOOL)isLogin;

+(DeviceType)currentDevice;

@end
