//
//  CCEditMultiEnter.m
//  CCEditUtil
//
//  Created by ziooooo on 16/3/9.
//  Copyright © 2016年 ziooooo. All rights reserved.
//

#import "CCEditMultiEnter.h"

@implementation CCEditMultiEnter

-(void)cc_editWtihResult:(CCEditEnterStringResult)stringResult
{
    self.stringResult = stringResult;
    [self jumpToControllerWithControllerName:@"CCEditMultiEnterController"];
}

-(void)cc_editWtihObject:(id)obj editPropertyName:(NSString *)propertyName  result:(CCEditEnterObjectResult)objResult
{
    self.objResult = objResult;
    self.editObj = obj;
    self.editPropertyName = propertyName;
    [self jumpToControllerWithControllerName:@"CCEditMultiEnterController"];
}

@end
