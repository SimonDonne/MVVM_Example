//
//  Config.h

//
//    ********************************************
//                   接口ip地址
//    ********************************************
#import <Foundation/Foundation.h>
#ifndef Config_h
#define Config_h


#endif /* Config_h */

//定义返回请求数据的block类型
typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^FailureBlock)();
typedef void (^NetWorkBlock)(BOOL netConnetState);




