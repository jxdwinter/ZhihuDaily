//
//  ZHD_GlobalClass.m
//  ZhihuDaily
//
//  Created by JiangXiaodong on 5/30/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//

#import "ZHD_GlobalClass.h"

@implementation ZHD_GlobalClass

+ (NSString *) getCurrentDate{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    return [dateFormatter stringFromDate:[NSDate date]];
}

+ (UIColor *)  sharedColor{
    return [UIColor lightGrayColor];
}

+ (UIColor *)  sharedTextColor{
    return [UIColor colorWithRed:(86/255.0) green:(86/255.0) blue:(86/255.0) alpha:1.0];
}

@end
