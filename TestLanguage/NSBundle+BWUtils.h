//
//  NSBundle+BWUtils.h
//  Language
//
//  Created by syt on 2019/12/13.
//  Copyright © 2019 syt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BWLanguageUtil.h"



NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (BWUtils)
/**
 获取当前APP使用语言
 @return 获取当前APP使用语言
 */
+ (NSString *)currentLanguage;


@end

NS_ASSUME_NONNULL_END
