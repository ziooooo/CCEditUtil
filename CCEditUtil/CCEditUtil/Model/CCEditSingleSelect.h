//
//  CCEditSingleSelect.h
//  CCEditUtil
//
//  Created by ziooooo on 16/3/9.
//  Copyright © 2016年 ziooooo. All rights reserved.
//

#import "CCEditBase.h"

@interface CCEditSingleSelect : CCEditBase

@property (strong ,nonatomic)NSArray *optionsArray;

@property (copy ,nonatomic)NSString *currentOptionString;

@property (copy ,nonatomic)NSString *cleanOptionString;

@property (assign ,nonatomic)BOOL isObjectOption;

@property (copy ,nonatomic)NSString *optionPropertyName;

@property (copy ,nonatomic)NSString *selectPropertyName;

@end
