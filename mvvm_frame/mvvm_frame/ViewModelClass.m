//
//  ViewModelClass.m
//  MVVMTest
//
//  Created by 李泽鲁 on 15/1/8.
//  Copyright (c) 2015年 李泽鲁. All rights reserved.
//

#import "ViewModelClass.h"
@implementation ViewModelClass


#pragma 接收穿过来的block
-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock

               WithFailureBlock: (FailureBlock) failureBlock
{
    _returnBlock = returnBlock;
    
    _failureBlock = failureBlock;
    
       
}

@end
