//
//  EditController.h
//  CCEditUtil
//
//  Created by ziooooo on 2017/5/2.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditController;

@protocol EditControllerDelegate <NSObject>

-(void)editController:(EditController *)editVc editText:(NSString *)text;

@end

@interface EditController : UIViewController

@property (weak ,nonatomic)id<EditControllerDelegate>delegate;

@end


