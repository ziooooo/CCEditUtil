//
//  ViewController.m
//  CCEditUtil
//
//  Created by ziooooo on 2017/4/28.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "ViewController.h"
#import "EditController.h"
#import "CCEditUtil.h"

@interface ViewController ()<EditControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CCEditSingleEnter *edit = [[CCEditSingleEnter alloc]init];
    edit.currentController = self;
    [edit cc_editWtihResult:^(NSString *result) {
        NSLog(@"%@",result);
    }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EditController *orderVc = segue.destinationViewController;
    orderVc.delegate = self;
}

-(void)editController:(EditController *)editVc editText:(NSString *)text
{
    NSLog(@"%@",text);
}


@end
