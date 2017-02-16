//
//  ViewModelClass.h
//  MVVMTest
//
//  Created by 李泽鲁 on 15/1/8.
//  Copyright (c) 2015年 李泽鲁. All rights reserved.
//

//Kicking off network or database requests
//Determining when information should be hidden or shown
//Date and number formatting
//Localization

#import <Foundation/Foundation.h>

@interface ViewModelClass : NSObject

@property (strong, nonatomic) ReturnValueBlock returnBlock;

@property (strong, nonatomic) FailureBlock failureBlock;



// 传入交互的Block块
-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock

               WithFailureBlock: (FailureBlock) failureBlock;
@end
