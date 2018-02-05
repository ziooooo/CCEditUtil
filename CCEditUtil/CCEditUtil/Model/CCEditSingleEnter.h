//
//  CCEditSingleEnter.h
//  CCEditUtil
//
//  Created by ziooooo on 16/3/3.
//  Copyright © 2016年 ziooooo. All rights reserved.
//

#import "CCEditBase.h"
#import "CCEditUtilValidate.h"

@interface CCEditSingleEnter : CCEditBase<CCEditUtilValidate>

@property (copy ,nonatomic)NSString *currentText;

@property (copy ,nonatomic)NSString *title;

@property (copy ,nonatomic)NSString *subTitle;

@property (copy ,nonatomic)NSString *placeholder;

@property (copy ,nonatomic)NSString *enterDescription;

@property (assign ,nonatomic)UIKeyboardType keyboardType;

@end
