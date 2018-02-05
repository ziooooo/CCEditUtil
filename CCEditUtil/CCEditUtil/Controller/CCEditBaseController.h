//
//  CCEditBaseController.h
//  CCEditUtil
//
//  Created by ziooooo on 16/3/3.
//  Copyright © 2016年 ziooooo. All rights reserved.
//

#import "CCEditBase.h"
@interface CCEditBaseController : UIViewController

@property (strong ,nonatomic)CCEditBase<CCEditUtilChannel> *editEnter;

-(void)cc_setupNavItemWithTitle:(NSString *)rightItemTitle;

-(void)cc_clickRightItem;

@end
