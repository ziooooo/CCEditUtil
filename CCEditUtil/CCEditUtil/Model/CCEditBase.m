//
//  CCEditBase.m
//  CCEditUtil
//
//  Created by ziooooo on 16/3/9.
//  Copyright © 2016年 ziooooo. All rights reserved.
//

#import "CCEditBase.h"

@implementation CCEditBase

@synthesize stringResult;
@synthesize objResult;
@synthesize editObj;
@synthesize editPropertyName;

-(void)cc_editWtihResult:(CCEditEnterStringResult)_stringResult{}

-(void)cc_editWtihObject:(id)obj editPropertyName:(NSString *)propertyName result:(CCEditEnterObjectResult)objResult{}

-(void)setEditObj:(id)obj
{
    NSAssert(obj, @"obj can't be nil");
    editObj = obj;
}

-(void)setEditPropertyName:(NSString *)propertyName
{
    NSAssert(propertyName, @"propertyName can't be nil");
    editPropertyName = propertyName;
}



-(void)setCurrentController:(UIViewController *)currentController
{
    NSAssert(currentController.navigationController, @"当前控制器必须有导航控制器");
    _currentController = currentController;
    
}

-(void)jumpToControllerWithControllerName:(NSString *)controllerName
{
    Class vcClass = NSClassFromString(controllerName);
    id controller = [vcClass new];
    if ([controller isKindOfClass:[UIViewController class]]) {
        controller = [[vcClass alloc] initWithNibName:controllerName bundle:nil];
        [controller setValue:self forKey:@"editEnter"];
        [self.currentController.navigationController pushViewController:controller animated:YES];
    }
    else{
        NSAssert(0, @"controllerName 不是 view controller");
    }
}

@end
