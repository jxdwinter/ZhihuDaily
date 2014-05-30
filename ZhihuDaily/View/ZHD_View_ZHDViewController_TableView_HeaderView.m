//
//  ZHD_View_ZHDViewController_TableView_HeaderView.m
//  ZhihuDaily
//
//  Created by JiangXiaodong on 5/30/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//

#import "ZHD_View_ZHDViewController_TableView_HeaderView.h"

#import "ZHD_View_ZHDViewController_SingleView.h"
@class ZHD_Entity_TopStory;

@implementation ZHD_View_ZHDViewController_TableView_HeaderView

- (id)init
{
    return [self initWithFrame:CGRectZero withTopStories:nil];
}

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame withTopStories:nil];
}

- (instancetype) initWithFrame:(CGRect)frame withTopStories : (NSArray *) topStories{
    self = [super initWithFrame:frame];
    if (self) {
        if (topStories && [topStories count]) {
            self.contentSize = CGSizeMake( SCREENWIDTH * [topStories count], 160.0);
            self.showsVerticalScrollIndicator = NO;
            self.showsHorizontalScrollIndicator = NO;
            self.scrollEnabled = YES;
            self.pagingEnabled = YES;
            self.bounces = NO;
            [topStories enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                ZHD_View_ZHDViewController_SingleView *view = [[ZHD_View_ZHDViewController_SingleView alloc]
                                                               initWithFrame:CGRectMake(SCREENWIDTH*idx, 0.0, SCREENWIDTH, 160.0) withTopStory:obj];
                [self addSubview:view];
            }];
        }
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
