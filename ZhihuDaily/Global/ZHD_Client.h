//
//  ZHD_Client.h
//  ZhihuDaily
//
//  Created by JiangXiaodong on 5/30/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZHD_Entity_StoryDetail;

@interface ZHD_Client : NSObject

+ (instancetype)sharedClient;

- (void)getLatestPostsWithController : (UIViewController *)controller
                             success : (void (^)(NSString *date, NSArray *topStories, NSArray *stories))success
                             failure : (void (^)(NSError *error))failure;

- (void)getPostsBeforeWithController : (UIViewController *)controller
                            withDate :(NSString *)date
                             success : (void (^)(NSString *date, NSArray *stories))success
                             failure : (void (^)(NSError *error))failure;

- (void)getPostContentByID : (NSString *)postID
            withController : (UIViewController *)controller
                   success : (void (^)(ZHD_Entity_StoryDetail *story))success
                   failure : (void (^)(NSError *error))failure;

@end
