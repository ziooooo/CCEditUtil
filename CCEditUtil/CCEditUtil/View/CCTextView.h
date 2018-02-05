//
//  CCTextView.h
//  CCEditUtil
//
//  Created by ziooooo on 16/3/9.
//  Copyright © 2016年 ziooooo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCTextView : UITextView

@property (nonatomic, copy) NSString *placeholder;

@property (nonatomic, strong) UIColor *placeholderColor;

@property (nonatomic, weak) UILabel *placeholderLabel;

@end
