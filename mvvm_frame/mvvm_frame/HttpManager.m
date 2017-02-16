//
//  HttpManager.m
//  hemale_3
//
//  Created by 和马乐 on 16/7/6.
//  Copyright © 2016年 和马乐. All rights reserved.
//

#import "HttpManager.h"


@implementation HttpManager
{
    NSArray *array;
}


+ (instancetype)shareInstance
{
    static HttpManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HttpManager alloc]init];
    });
    return manager;
}


#pragma 监测网络的可链接性
- (BOOL) netWorkReachabilityWithURLString:(NSString *) strUrl
{
    __block BOOL netState = NO;
    
    NSURL *baseURL = [NSURL URLWithString:strUrl];
    
    
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    
    NSOperationQueue *operationQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
//                NSLog(@"wwan");
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                netState = YES;
//                NSLog(@"wifi");
                break;
            case AFNetworkReachabilityStatusNotReachable:
//                NSLog(@"no");
                netState = NO;
            default:
//                NSLog(@"duanlian");
                [operationQueue setSuspended:YES];
                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
    
    return netState;
}


#pragma --mark GET请求方式
- (void) NetRequestGETWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                WithReturnValeuBlock: (httpRequestSuccess) successBlock
                    WithFailureBlock: (httpRequestFailure) failureBlock
{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
    [manager GET:requestURLString parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
       
        
         successBlock(self,responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failureBlock(self,error);
        
    }];
 

    
}

#pragma --mark POST请求方式

- (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
                        WithParameter: (NSDictionary *) parameter
                 WithReturnValeuBlock: (httpRequestSuccess) successBlock
                     WithFailureBlock: (httpRequestFailure) failureBlock

{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
     manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
    [manager POST:requestURLString parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        successBlock(self,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failureBlock(self,error);
        
    }];
    
    
    
    
    
}




@end
