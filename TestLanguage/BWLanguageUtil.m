//
//  BWLanguageUtil.m
//  Language
//
//  Created by syt on 2019/12/13.
//  Copyright © 2019 syt. All rights reserved.
//

#import "BWLanguageUtil.h"

static NSString *TableName = @"localization";
static NSBundle *bundle = nil;
static NSString *UserLanguage = @"UserLanguage";

@implementation BWLanguageUtil

+ (NSBundle *)bundle
{
    if (!bundle) {
        [self initUserLanguage];
    }
    return bundle;
}

+ (void)initUserLanguage
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *string = [def objectForKey:UserLanguage];
    if (string.length == 0) {
        // 获取系统当前语言版本(中文zh-Hans,英文en)
        NSArray *languages = [NSLocale preferredLanguages];
        NSString *current = [languages objectAtIndex:0];
        string = [self languageFormat:current];
        // 数据持久化保存
        [def setObject:current forKey:UserLanguage];
        [def synchronize];
    }
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:[self languageFormat:string] ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];
}

+ (void)setUserLanguage:(NSString *)language
{
    NSString *path = [[NSBundle mainBundle] pathForResource:[self languageFormat:language] ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:language forKey:UserLanguage];
    [def synchronize];
}

+ (NSString *)userLanguage
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *language = [[def objectForKey:UserLanguage] description];
    NSLog(@"存储的语言：%@", language);
//    return language == nil || [language containsString:@"null"] ? @"zh-Hans" : language;
    return language;
}

+ (NSString *)getStringByKey:(NSString *)key
{
    return [[BWLanguageUtil bundle] localizedStringForKey:key value:nil table:TableName];
}

#pragma mark - 语言和语言对应的.lproj的文件夹前缀不一致时在这里做处理
+ (NSString *)languageFormat:(NSString *)language
{
    if ([language rangeOfString:@"zh-Hans"].location != NSNotFound) {
        return @"zh-Hans";
    } else if ([language rangeOfString:@"zh-Hant"].location != NSNotFound) {
        return @"zh-Hant";
    } else {
        if ([language rangeOfString:@"-"].location != NSNotFound) {
            // 除了中文以外的其他语言统一处理@"ru_RU" @"ko_KR"取前面一部分
            NSArray *ary = [language componentsSeparatedByString:@"-"];
            if (ary.count > 1) {
                NSString *str = ary[0];
                return str;
            }
        }
    }
    return language;
}


@end
