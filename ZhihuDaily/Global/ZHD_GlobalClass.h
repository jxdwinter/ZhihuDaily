//
//  ZHD_GlobalClass.h
//  ZhihuDaily
//
//  Created by JiangXiaodong on 5/30/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHD_GlobalClass : NSObject

/*!
 *  获取今日日期
 *
 *  @return 时间格式为"20140530"
 */
+ (NSString *) getCurrentDate;
+ (UIColor *)  sharedColor;
+ (UIColor *)  sharedTextColor;
@end
