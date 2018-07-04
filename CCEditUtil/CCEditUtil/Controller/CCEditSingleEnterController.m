//
//  CCEditSingleEnterController.m
//  CCEditUtil
//
//  Created by ziooooo on 16/3/3.
//  Copyright © 2016年 ziooooo. All rights reserved.
//

#import "CCEditSingleEnterController.h"
#import "CCEditSingleEnter.h"
@interface CCEditSingleEnterController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation CCEditSingleEnterController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化控件内容
    [self setupComponentContent];
}


-(void)setupComponentContent
{
    if (!self.editEnter)return;
    if (![self.editEnter isKindOfClass:[CCEditSingleEnter class]])return;
    
    CCEditSingleEnter *editSingleEnter = (CCEditSingleEnter *)self.editEnter;
    self.titleLabel.text = editSingleEnter.title;
    self.subTitleLabel.text = editSingleEnter.subTitle;
    if (editSingleEnter.currentText) {
        self.textField.text = editSingleEnter.currentText;
    }
    self.textField.placeholder = editSingleEnter.placeholder;
    self.textField.keyboardType = editSingleEnter.keyboardType;
    self.descLabel.text = editSingleEnter.enterDescription;
    self.title = editSingleEnter.controllerTitle;
    
    self.textField.delegate = self;
    
    [self.textField becomeFirstResponder];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)cc_clickRightItem
{
    CCEditSingleEnter *editSingleEnter = (CCEditSingleEnter *)self.editEnter;
    if (editSingleEnter.regexString) { //需要验证
        if (![self.textField.text cc_validateWithRegex:editSingleEnter.regexString]){//验证不通过
            if (editSingleEnter.mismatchesResult) {
                editSingleEnter.mismatchesResult(self.textField.text);
            }
            return;
        }
        
    }
    if (editSingleEnter.stringResult) {
        editSingleEnter.stringResult(self.textField.text);
    }
    else if (editSingleEnter.objResult){
        //给所传对象 需要修改的属性 赋值
        NSString *resStr = nil;
        if ([self.textField.text isEqualToString:@""]) {
            resStr = nil;
        }
        else{
            resStr = self.textField.text;
        }
        [editSingleEnter.editObj setValue:resStr forKey:editSingleEnter.editPropertyName];
        editSingleEnter.objResult(editSingleEnter.editObj);
    }
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self cc_clickRightItem];
    return YES;
}


@end
