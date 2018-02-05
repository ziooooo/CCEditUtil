//
//  CCEditBase.h
//  CCEditUtil
//
//  Created by ziooooo on 16/3/9.
//  Copyright © 2016年 ziooooo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCEditUtilChannel.h"

@interface CCEditBase : NSObject <CCEditUtilChannel>

@property (weak ,nonatomic)UIViewController *currentController;

@property (copy ,nonatomic)NSString *controllerTitle;

-(void)jumpToControllerWithControllerName:(NSString *)controllerName;

@end

