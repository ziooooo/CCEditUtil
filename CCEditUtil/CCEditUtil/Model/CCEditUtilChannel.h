//
//  CCEditUtilChannel.h
//  CCEditUtil
//
//  Created by ziooooo on 16/3/18.
//  Copyright © 2016年 ziooooo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  用户输入结果block
 *
 *  @param result 用户输入结果
 */
typedef void(^editEnterResult)(NSString *result);
typedef editEnterResult CCEditEnterStringResult;
/**
 *  对象结果
 *
 *  @param obj 输出对象
 */
typedef void(^editEnterObjectResult)(id obj);
typedef editEnterObjectResult CCEditEnterObjectResult;

@protocol CCEditUtilChannel <NSObject>

@property (copy ,nonatomic)CCEditEnterStringResult stringResult;

@property (copy ,nonatomic)CCEditEnterObjectResult objResult;

@property (strong ,nonatomic)id editObj;

@property (copy ,nonatomic)NSString *editPropertyName;

-(void)cc_editWtihResult:(CCEditEnterStringResult)result;

-(void)cc_editWtihObject:(id)obj editPropertyName:(NSString *)propertyName  result:(CCEditEnterObjectResult)result;

@end
