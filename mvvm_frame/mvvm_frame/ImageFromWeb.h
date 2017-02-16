//
//  ImageFromWeb.h
//  hemale_3
//
//  Created by 和马乐 on 16/7/11.
//  Copyright © 2016年 和马乐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageFromWeb : NSObject


//获取webView中的所有图片URL
- (NSArray *) getImageurlFromHtml:(NSString *) webString;


@end
