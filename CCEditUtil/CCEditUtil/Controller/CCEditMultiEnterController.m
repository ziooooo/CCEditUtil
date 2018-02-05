//
//  CCEditMultiEnterController.m
//  CCEditUtil
//
//  Created by ziooooo on 16/3/9.
//  Copyright © 2016年 ziooooo. All rights reserved.
//

#import "CCEditMultiEnterController.h"
#import "CCTextView.h"
#import "CCEditMultiEnter.h"

@interface CCEditMultiEnterController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (weak, nonatomic) IBOutlet UIView *textViewBackView;

@property (weak, nonatomic) IBOutlet CCTextView *textView;

@end

@implementation CCEditMultiEnterController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化控件内容
    [self setupComponentContent];
}


-(void)setupComponentContent
{
    if (!self.editEnter)return;
    if (![self.editEnter isKindOfClass:[CCEditMultiEnter class]])return;
    
    CCEditMultiEnter *editMultiEnter = (CCEditMultiEnter *)self.editEnter;
    self.titleLabel.text = editMultiEnter.title;
    self.subTitleLabel.text = editMultiEnter.subTitle;
    self.textView.placeholder = editMultiEnter.placeholder;
    if (editMultiEnter.currentText) {
        self.textView.text = editMultiEnter.currentText;
        self.textView.placeholder = @"";
    }
    self.textView.keyboardType = editMultiEnter.keyboardType;
    self.descLabel.text = editMultiEnter.enterDescription;
    self.title = editMultiEnter.controllerTitle;
    
    [self.textView becomeFirstResponder];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)cc_clickRightItem
{
    CCEditMultiEnter *editMultiEnter = (CCEditMultiEnter *)self.editEnter;
    if (editMultiEnter.regexString) { //需要验证
        if (![self.textView.text cc_validateWithRegex:editMultiEnter.regexString]){//验证不通过
            if (editMultiEnter.mismatchesResult) {
                editMultiEnter.mismatchesResult(self.textView.text);
            }
            return;
        }
        
    }
    if (editMultiEnter.stringResult) {
        editMultiEnter.stringResult(self.textView.text);
    }
    else if (editMultiEnter.objResult){
        //给所传对象 需要修改的属性 赋值
        NSString *resStr = nil;
        if ([self.textView.text isEqualToString:@""]) {
            resStr = nil;
        }
        else{
            resStr = self.textView.text;
        }
        [editMultiEnter.editObj setValue:resStr forKey:editMultiEnter.editPropertyName];
        editMultiEnter.objResult(editMultiEnter.editObj);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

@end
