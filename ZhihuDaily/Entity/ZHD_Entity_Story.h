//
//  ZHD_Entity_Story.h
//  ZhihuDaily
//
//  Created by JiangXiaodong on 5/30/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHD_Entity_Story : NSObject<NSCoding>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *share_url;
@property (nonatomic, copy) NSString *ga_prefix;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, strong) NSNumber* storyId;

- (instancetype) initWithStoryDictionary : (NSDictionary *) storyDictionary;

@end
