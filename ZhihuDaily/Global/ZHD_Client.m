//
//  ZHD_Client.m
//  ZhihuDaily
//
//  Created by JiangXiaodong on 5/30/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//
static NSString * const kClientBaseURL = @"http://news-at.zhihu.com/api/3/";

#import "ZHD_Client.h"
#import "AFHTTPClient.h"
#import "CheckNetwork.h"
#import "ZHD_Entity_TopStory.h"
#import "ZHD_Entity_Story.h"
#import "ZHD_Entity_StoryDetail.h"
#import "MBProgressHUD.h"

@interface ZHD_Client ()
@property (nonatomic, strong) AFHTTPClient *httpClient;
@end

@implementation ZHD_Client


+ (instancetype)sharedClient
{
    static ZHD_Client *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[ZHD_Client alloc] init];
    });

    return _sharedClient;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _httpClient = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:kClientBaseURL]];
    }

    return self;
}

- (void)getLatestPostsWithController : (UIViewController *)controller
                             success : (void (^)(NSString *date, NSArray *topStories, NSArray *stories))success
                             failure : (void (^)(NSError *error))failure{
    if ([CheckNetwork isExistenceNetwork]) {


        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:controller.view animated:YES];
        hud.labelText = @"Loading";

        [_httpClient getPath:@"news/latest"
                  parameters:nil
                     success:^(AFHTTPRequestOperation *operation, id responseObject){
                         NSError *error;
                         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                              options:NSJSONReadingMutableContainers
                                                                                error:&error];
                         if (error && failure) {
                             failure(error);
                             return;
                         }
                         if (!dict) return;
                         NSString *date = dict[@"date"];
                         NSMutableArray *tmpTopStories = [NSMutableArray array];
                         NSMutableArray *tmpStories = [NSMutableArray array];
                         [dict[@"top_stories"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                             ZHD_Entity_TopStory * topStory = [[ZHD_Entity_TopStory alloc] initWithTopStoryDictionary:(NSDictionary *)obj];
                             [tmpTopStories addObject:topStory];
                         }];
                         [dict[@"stories"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                             ZHD_Entity_Story * story = [[ZHD_Entity_Story alloc] initWithStoryDictionary:(NSDictionary *)obj];
                             if ([story.type isEqualToNumber:[NSNumber numberWithInt:0]] ) {
                                 [tmpStories addObject:story];
                             }
                         }];
                         if (success) {
                             [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                             [MBProgressHUD hideHUDForView:controller.view animated:YES];
                             success(date, tmpTopStories,tmpStories);
                         }
                     }failure:^(AFHTTPRequestOperation *operation, NSError *error){
                         [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                         [MBProgressHUD hideHUDForView:controller.view animated:YES];
                         if (error && failure) {
                             failure(error);
                         }
                     }];
    }else{

    }

}

- (void)getPostsBeforeWithController : (UIViewController *)controller
                            withDate :(NSString *)date
                             success : (void (^)(NSString *date, NSArray *stories))success
                             failure : (void (^)(NSError *error))failure{
    if ([CheckNetwork isExistenceNetwork]) {
        NSMutableString *path = [@"news/before/" mutableCopy];
        if (date) {
            [path appendString:date];
        }
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:controller.view animated:YES];
        hud.labelText = @"Loading";
        [_httpClient getPath:path
                  parameters:nil
                     success:^(AFHTTPRequestOperation *operation, id responseObject){
                         NSError *error;
                         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                              options:NSJSONReadingMutableContainers
                                                                                error:&error];
                         if (error && failure) {
                             failure(error);
                             return;
                         }
                         if (!dict) return;
                         NSString *date = dict[@"date"];
                         NSMutableArray *tmpStories = [NSMutableArray array];
                         [dict[@"stories"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                             ZHD_Entity_Story * story = [[ZHD_Entity_Story alloc] initWithStoryDictionary:(NSDictionary *)obj];
                             [tmpStories addObject:story];
                         }];
                         if (success) {
                             [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                             [MBProgressHUD hideHUDForView:controller.view animated:YES];
                             success(date, tmpStories);
                         }
                     }failure:^(AFHTTPRequestOperation *operation, NSError *error){
                         [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                         [MBProgressHUD hideHUDForView:controller.view animated:YES];
                         if (error && failure) {
                             failure(error);
                         }
                     }];
    }else{

    }

}

- (void)getPostContentByID : (NSString *)postID
            withController : (UIViewController *)controller
                   success : (void (^)(ZHD_Entity_StoryDetail *story))success
                   failure : (void (^)(NSError *error))failure{
    if ([CheckNetwork isExistenceNetwork]) {
        NSString *path = [NSString stringWithFormat:@"news/%@", postID];
        [_httpClient getPath:path
                  parameters:nil
                     success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             NSError *error;
             NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                  options:NSJSONReadingMutableContainers
                                                                    error:&error];
             if (error && failure) {
                 failure(error);
                 return;
             }
             if (!dict ) return;

             ZHD_Entity_StoryDetail *stroy = [[ZHD_Entity_StoryDetail alloc] initWithStoryDetailDictionary:dict];
             if (success) {
                 success(stroy);
             }
         } failure:^(AFHTTPRequestOperation *operation, NSError *error){
             if (error && failure) {
                 failure(error);
             }
         }];
    }else{
        
    }
}

@end
