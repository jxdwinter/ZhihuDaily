//
//  ZHD_Entity_StoryDetail.m
//  ZhihuDaily
//
//  Created by JiangXiaodong on 5/30/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//

#import "ZHD_Entity_StoryDetail.h"

@implementation ZHD_Entity_StoryDetail

- (instancetype) initWithStoryDetailDictionary : (NSDictionary *) storyDetailDictionary{
    if (storyDetailDictionary) {
        self = [super init];
        if (self) {
            _body = storyDetailDictionary[@"body"];
            _image_source = storyDetailDictionary[@"image_source"];
            _title = storyDetailDictionary[@"title"];
            _image = storyDetailDictionary[@"image"];
            _share_url = storyDetailDictionary[@"share_url"];
            _ga_prefix = storyDetailDictionary[@"ga_prefix"];
            _type = [NSNumber numberWithLong:[storyDetailDictionary[@"type"] integerValue]];
            _storyId = [NSNumber numberWithLong:[storyDetailDictionary[@"id"] integerValue]];
            _js = storyDetailDictionary[@"js"];
            _css = storyDetailDictionary[@"css"];
        }
    }
    return self;
}

- (instancetype)init{
    @throw [NSException exceptionWithName:@"Init Error"
                                   reason:@"Use - (instancetype) initWithStoryDetailDictionary : (NSDictionary *) storyDetailDictionary"
                                 userInfo:nil];
    return nil;
}

- (void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeObject:_image forKey:@"image"];
    [aCoder encodeObject:_share_url forKey:@"share_url"];
    [aCoder encodeObject:_ga_prefix forKey:@"ga_prefix"];
    [aCoder encodeObject:_type forKey:@"type"];
    [aCoder encodeObject:_storyId forKey:@"storyId"];
    [aCoder encodeObject:_image_source forKey:@"image_source"];
    [aCoder encodeObject:_body forKey:@"body"];
    [aCoder encodeObject:_js forKey:@"js"];
    [aCoder encodeObject:_css forKey:@"css"];
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        [self setTitle:[aDecoder decodeObjectForKey:@"title"]];
        [self setImage:[aDecoder decodeObjectForKey:@"image"]];
        [self setShare_url:[aDecoder decodeObjectForKey:@"share_url"]];
        [self setGa_prefix:[aDecoder decodeObjectForKey:@"ga_prefix"]];
        [self setType:[aDecoder decodeObjectForKey:@"type"]];
        [self setStoryId:[aDecoder decodeObjectForKey:@"storyId"]];
        [self setBody:[aDecoder decodeObjectForKey:@"body"]];
        [self setImage_source:[aDecoder decodeObjectForKey:@"image_source"]];
        [self setJs:[aDecoder decodeObjectForKey:@"js"]];
        [self setCss:[aDecoder decodeObjectForKey:@"css"]];
    }
    return self;
}

@end
