//
//  CCEditSingleEnter.m
//  CCEditUtil
//
//  Created by ziooooo on 16/3/3.
//  Copyright © 2016年 ziooooo. All rights reserved.
//

#import "CCEditSingleEnter.h"
@implementation CCEditSingleEnter

@synthesize regexString;
@synthesize mismatchesResult;

-(void)cc_editWtihResult:(CCEditEnterStringResult)stringResult
{
    self.stringResult = stringResult;
    [self jumpToControllerWithControllerName:@"CCEditSingleEnterController"];
}

-(void)cc_editWtihObject:(id)obj editPropertyName:(NSString *)propertyName  result:(CCEditEnterObjectResult)objResult
{
    self.objResult = objResult;
    self.editObj = obj;
    self.editPropertyName = propertyName;
    [self jumpToControllerWithControllerName:@"CCEditSingleEnterController"];
}

-(void)cc_setRegexString:(NSString *)_regexString result:(CCEditMismatchesResult)_mismatchesResult
{
    self.regexString = _regexString;
    self.mismatchesResult = _mismatchesResult;
    
}


@end
