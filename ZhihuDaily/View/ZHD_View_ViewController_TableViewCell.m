//
//  ZHD_View_ViewController_TableViewCell.m
//  ZhihuDaily
//
//  Created by JiangXiaodong on 5/30/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//

#import "ZHD_View_ViewController_TableViewCell.h"

@implementation ZHD_View_ViewController_TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.thumbnailImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, 10.0, 75.0, 60.0)];
        [self.thumbnailImageView setContentScaleFactor:[[UIScreen mainScreen] scale]];
        self.thumbnailImageView.contentMode =  UIViewContentModeScaleAspectFill;
        self.thumbnailImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.thumbnailImageView.clipsToBounds  = YES;
        [self.contentView addSubview:self.thumbnailImageView];

        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10.0, 200.0, 60.0)];
        self.titleLabel.textColor = [ZHD_GlobalClass sharedTextColor];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:self.titleLabel];

    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
