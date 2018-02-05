//
//  EditController.m
//  CCEditUtil
//
//  Created by ziooooo on 2017/5/2.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "EditController.h"

@interface EditController ()
- (IBAction)done:(UIButton *)sender;

@end

@implementation EditController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)done:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(editController:editText:)]) {
        
        [self.delegate editController:self editText:@"李卓"];
        
    }
    
}



@end
