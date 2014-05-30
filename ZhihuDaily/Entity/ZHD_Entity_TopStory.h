//
//  ZHD_Entity_TopStory.h
//  ZhihuDaily
//
//  Created by JiangXiaodong on 5/30/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHD_Entity_TopStory : NSObject <NSCoding>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *share_url;
@property (nonatomic, copy) NSString *ga_prefix;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, strong) NSNumber* topStoryId;


- (instancetype) initWithTopStoryDictionary : (NSDictionary *) topStoryDictionary;

@end
