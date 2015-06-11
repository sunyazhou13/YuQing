//
//  Function.m
//  yuqing2
//
//  Created by wangshun on 15/5/27.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "Function.h"

@implementation Function

+ (BOOL)isLogin{
    
   return [[NSUserDefaults standardUserDefaults] boolForKey:IsLogin];
}

+(DeviceType)currentDevice
{
    DeviceType device=iphone5s;
    if([UIScreen instancesRespondToSelector:@selector(currentMode)])
    {
        CGSize  size=[[UIScreen mainScreen] currentMode].size;
        if(CGSizeEqualToSize(CGSizeMake(640,960),size))
        {
            device=iphone4s;
        }
        else if(CGSizeEqualToSize(CGSizeMake(640,1136),size))
        {
            device=iphone5s;
        }
        else if(CGSizeEqualToSize(CGSizeMake(750,1334),size))
        {
            device=iphone6;
        }
        else if(CGSizeEqualToSize(CGSizeMake(1242,2208),size))
        {
            device=iphone6p;
        }
        else if(CGSizeEqualToSize(CGSizeMake(1242,2208),size))//iphone6p 标准模式
        {
            device=iphone6p;
        }
        else if(CGSizeEqualToSize(CGSizeMake(1125,2001),size))//iphone6p 放大模式
        {
            device=iphone6p;
        }
    }
    return device;
}



@end
