//
//  BWLanguageUtil.h
//  Language
//
//  Created by syt on 2019/12/13.
//  Copyright © 2019 syt. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWLanguageUtil : NSObject
/**
 获取当前资源文件
 */
+ (NSBundle *)bundle;
/**
 初始化语言文件
 */
+ (void)initUserLanguage;
/**
 获取当前应用语言
 */
+ (NSString *)userLanguage;
/**
 设置当前语言
 */
+ (void)setUserLanguage:(NSString *)language;
/**
 通过key获取对应的string
 */
+ (NSString *)getStringByKey:(NSString *)key;



@end

NS_ASSUME_NONNULL_END
