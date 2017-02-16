//
//  HttpManager.h
//  hemale_3
//
//  Created by 和马乐 on 16/7/6.
//  Copyright © 2016年 和马乐. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HttpManager;

//成功的回调
typedef void (^httpRequestSuccess)(HttpManager *manager,id object);
//失败的回调
typedef void (^httpRequestFailure) (HttpManager *manager,NSError *error);

@interface HttpManager : NSObject
+ (instancetype)shareInstance;


#pragma 监测网络的可链接性
- (BOOL) netWorkReachabilityWithURLString:(NSString *) strUrl;

#pragma POST请求
- (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
                        WithParameter: (NSDictionary *) parameter
                 WithReturnValeuBlock: (httpRequestSuccess) successBlock
                     WithFailureBlock: (httpRequestFailure) failureBlock;

#pragma GET请求
- (void) NetRequestGETWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                WithReturnValeuBlock: (httpRequestSuccess) successBlock
                    WithFailureBlock: (httpRequestFailure) failureBlock;


@end
