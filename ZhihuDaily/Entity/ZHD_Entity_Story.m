//
//  ZHD_Entity_Story.m
//  ZhihuDaily
//
//  Created by JiangXiaodong on 5/30/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//

#import "ZHD_Entity_Story.h"

@implementation ZHD_Entity_Story

- (instancetype) initWithStoryDictionary : (NSDictionary *) topStoryDictionary{
    if (topStoryDictionary) {
        self = [super init];
        if (self) {
            _title = topStoryDictionary[@"title"];
            _image = [topStoryDictionary[@"images"] firstObject];
            _share_url = topStoryDictionary[@"share_url"];
            _ga_prefix = topStoryDictionary[@"ga_prefix"];
            _type = [NSNumber numberWithLong:[topStoryDictionary[@"type"] integerValue]];
            _storyId = [NSNumber numberWithLong:[topStoryDictionary[@"id"] integerValue]];
        }
    }
    return self;
}

- (instancetype)init{
    @throw [NSException exceptionWithName:@"Init Error"
                                   reason:@"Use - (instancetype) initWithStoryDictionary : (NSDictionary *) topStoryDictionary"
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
    }
    return self;
}

@end
