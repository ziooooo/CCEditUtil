//
//  CCEditSingleSelect.m
//  CCEditUtil
//
//  Created by ziooooo on 16/3/9.
//  Copyright © 2016年 ziooooo. All rights reserved.
//

#import "CCEditSingleSelect.h"

@implementation CCEditSingleSelect

-(void)cc_editWtihResult:(CCEditEnterStringResult)stringResult
{
    self.stringResult = stringResult;
    [self jumpToControllerWithControllerName:@"CCEditSingleSelectController"];
}

-(void)cc_editWtihObject:(id)obj editPropertyName:(NSString *)propertyName  result:(CCEditEnterObjectResult)objResult
{
    self.objResult = objResult;
    self.editObj = obj;
    self.editPropertyName = propertyName;
    [self jumpToControllerWithControllerName:@"CCEditSingleSelectController"];
}

@end
