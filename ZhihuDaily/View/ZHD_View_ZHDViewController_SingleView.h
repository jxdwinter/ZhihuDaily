//
//  ZHD_View_ZHDViewController_SingleView.h
//  ZhihuDaily
//
//  Created by JiangXiaodong on 5/30/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZHD_Entity_TopStory;

@interface ZHD_View_ZHDViewController_SingleView : UIView

- (instancetype) initWithFrame:(CGRect)frame withTopStory : (ZHD_Entity_TopStory *) topStory;

@end
