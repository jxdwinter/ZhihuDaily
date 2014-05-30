//
//  ZHD_View_ZHDViewController_SingleView.m
//  ZhihuDaily
//
//  Created by JiangXiaodong on 5/30/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//

#import "ZHD_View_ZHDViewController_SingleView.h"
#import "ZHD_Entity_TopStory.h"

@implementation ZHD_View_ZHDViewController_SingleView

- (id)init
{
    return [self initWithFrame:CGRectZero withTopStory:nil];
}

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame withTopStory:nil];
}

- (instancetype) initWithFrame:(CGRect)frame withTopStory : (ZHD_Entity_TopStory *) topStory{
    self = [super initWithFrame:frame];
    if (self) {
        if (topStory) {
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, SCREENWIDTH, 160.0)];
            [imageView setContentScaleFactor:[[UIScreen mainScreen] scale]];
            imageView.contentMode =  UIViewContentModeScaleAspectFill;
            imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            imageView.clipsToBounds  = YES;
            [imageView setImageWithURL:[NSURL URLWithString:topStory.image] placeholderImage:nil];

            UIImageView *grayImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 100.0, SCREENWIDTH, 60.0)];
            grayImageView.backgroundColor = [UIColor colorWithRed:(170.0/255.0) green:(170.0/255.0) blue:(170.0/255.0) alpha:0.6];
            [imageView addSubview:grayImageView];

            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 5.0, SCREENWIDTH - 20.0, 50.0)];
            titleLabel.numberOfLines = 0;
            titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
            titleLabel.textColor = [UIColor whiteColor];
            topStory.title = [topStory.title stringByAppendingString:@"\n \n \n \n "];
            titleLabel.text = topStory.title;

            [grayImageView addSubview:titleLabel];
            [self addSubview:imageView];
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
