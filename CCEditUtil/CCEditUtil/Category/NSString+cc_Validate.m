//
//  NSString+cc_Validate.m
//  CCEditUtil
//
//  Created by ziooooo on 16/3/7.
//  Copyright © 2016年 ziooooo. All rights reserved.
//

#import "NSString+cc_Validate.h"

NSString *const CC_REGEX_MOBILE = @"^((13[0-9])|(14[^4,\\D])|(15[^4,\\D])|(17[^4,\\D])|(18[0,0-9]))\\d{8}$";

NSString *const CC_REGEX_IDENTITY = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";

NSString *const CC_REGEX_EMAIL = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";

NSString *const CC_REGEX_CHINESE = @"(^[\u4e00-\u9fa5]+$)";

@implementation NSString (cc_Validate)


/**
 *  正则表达式验证
 *
 *  @param regex 正则表达式
 *
 *  @return 是/否
 */
-(BOOL)cc_validateWithRegex:(NSString *)regex{
    NSPredicate *codePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [codePredicate evaluateWithObject:self];
}
@end
