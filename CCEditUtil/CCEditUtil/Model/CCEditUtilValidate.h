//
//  CCEditUtilValidate.h
//  CCEditUtil
//
//  Created by ziooooo on 16/3/18.
//  Copyright © 2016年 ziooooo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+cc_Validate.h"

/**
 *  验证结果不匹配调用block
 *
 *  @param result 用户输入结果
 */
typedef void(^editMismatchesResult)(NSString *result);
typedef editMismatchesResult CCEditMismatchesResult;

@protocol CCEditUtilValidate <NSObject>

@property (copy ,nonatomic)NSString *regexString;

@property (copy ,nonatomic)CCEditMismatchesResult mismatchesResult;

-(void)cc_setRegexString:(NSString *)regexStr result:(CCEditMismatchesResult)result;

@end
