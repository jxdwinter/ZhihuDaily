//
//  ZHD_Entity_StoryDetail.h
//  ZhihuDaily
//
//  Created by JiangXiaodong on 5/30/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHD_Entity_StoryDetail : NSObject<NSCoding>

@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *image_source;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *share_url;
@property (nonatomic, copy) NSString *ga_prefix;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, strong) NSNumber* storyId;
@property (nonatomic, strong) NSArray *js;
@property (nonatomic, strong) NSArray* css;

- (instancetype) initWithStoryDetailDictionary : (NSDictionary *) storyDetailDictionary;

@end
