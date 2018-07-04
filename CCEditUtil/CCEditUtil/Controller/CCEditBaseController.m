//
//  CCEditBaseController.m
//  CCEditUtil
//
//  Created by ziooooo on 16/3/3.
//  Copyright © 2016年 ziooooo. All rights reserved.
//

#import "CCEditBaseController.h"
#import "CCEditUtilValidate.h"

@interface CCEditBaseController ()

@end

@implementation CCEditBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
    [self cc_setupNavItemWithTitle:@"done"];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //防止保留环
    self.editEnter.stringResult = nil;
    self.editEnter.objResult = nil;
    if ([self.editEnter conformsToProtocol:@protocol(CCEditUtilValidate)]) {
        [self.editEnter setValue:nil forKey:@"mismatchesResult"];
    }
}

-(void)cc_setupNavItemWithTitle:(NSString *)rightItemTitle
{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:rightItemTitle style:UIBarButtonItemStylePlain target:self action:@selector(cc_clickRightItem)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

-(void)cc_clickRightItem{}

@end
