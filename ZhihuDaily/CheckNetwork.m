//
//  CheckNetwork.m
//  iphone.network1
//
//  Created by JiangXiaodong on 5/30/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.

#import "CheckNetwork.h"
#import "Reachability.h"

@implementation CheckNetwork

+(BOOL)isExistenceNetwork
{
	BOOL isExistenceNetwork;
	Reachability *r = [Reachability reachabilityWithHostname:@"www.zhihu.com"];
    
    switch ([r currentReachabilityStatus])
    {
        case NotReachable:
			isExistenceNetwork=FALSE;
            break;
        case ReachableViaWWAN:
			isExistenceNetwork=TRUE;
            break;
        case ReachableViaWiFi:
			isExistenceNetwork=TRUE; 
            break;
    }
	return isExistenceNetwork;
}
@end
