//
//  NSString+cc_Validate.h
//  CCEditUtil
//
//  Created by ziooooo on 16/3/7.
//  Copyright © 2016年 ziooooo. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  手机号
 */
extern NSString *const CC_REGEX_MOBILE;
/**
 *  身份证
 */
extern NSString *const CC_REGEX_IDENTITY;
/**
 *  邮箱
 */
extern NSString *const CC_REGEX_EMAIL;
/**
 *  中文
 */
extern NSString *const CC_REGEX_CHINESE;

@interface NSString (cc_Validate)
/**
 *  正则表达式验证
 *
 *  @param regex 正则表达式
 *
 *  @return 是/否
 */
-(BOOL)cc_validateWithRegex:(NSString *)regex;

@end
