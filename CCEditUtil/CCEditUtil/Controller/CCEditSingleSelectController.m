//
//  CCEditSingleSelectController.m
//  CCEditUtil
//
//  Created by ziooooo on 16/3/10.
//  Copyright © 2016年 ziooooo. All rights reserved.
//

#import "CCEditSingleSelectController.h"
#import "CCEditSingleSelect.h"

static NSString *SelectCellId = @"SelectCellId";

@interface CCEditSingleSelectController ()<UITableViewDataSource ,UITableViewDelegate>

@property (strong ,nonatomic)NSArray *optionsArray;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (assign ,nonatomic)NSInteger currentSelectedRow;

@end

@implementation CCEditSingleSelectController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self cc_setupNavItemWithTitle:nil];
    //初始化
    [self setInitialize];
    
    [self setupOptions];
}


#pragma mark - 初始化
-(void)setInitialize
{
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.currentSelectedRow = -1;
    
}

#pragma mark - 设置数据
-(void)setupOptions
{
    if (!self.editEnter)return;
    if (![self.editEnter isKindOfClass:[CCEditSingleSelect class]])return;
    CCEditSingleSelect *editSingleSelect = (CCEditSingleSelect *)self.editEnter;
    self.optionsArray = editSingleSelect.optionsArray;
    
    [self.tableView reloadData];
    
    self.title = editSingleSelect.controllerTitle;
    
}

#pragma mark - tableView datasource 

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CCEditSingleSelect *editSingleSelect = (CCEditSingleSelect *)self.editEnter;
    NSInteger rows = self.optionsArray.count;
    if (editSingleSelect.cleanOptionString) {
        rows = self.optionsArray.count + 1;
    }
    return rows;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CCEditSingleSelect *editSingleSelect = (CCEditSingleSelect *)self.editEnter;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SelectCellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:SelectCellId];
    }
    
    NSString *optionStr = nil;
    
    NSInteger optionIndex = indexPath.row;
    
    if (editSingleSelect.cleanOptionString && optionIndex == 0) {
        optionStr = editSingleSelect.cleanOptionString;
    }
    
    if (editSingleSelect.cleanOptionString)optionIndex -= 1;
    
    if (optionIndex >= 0) {
        if (editSingleSelect.isObjectOption) {
            optionStr = [self.optionsArray[optionIndex] valueForKey:editSingleSelect.optionPropertyName];
        }
        else{
            optionStr = self.optionsArray[optionIndex];
        }
    }

    cell.textLabel.text = optionStr;
    if ([optionStr isEqualToString:editSingleSelect.currentOptionString]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

#pragma mark - tableview delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CCEditSingleSelect *editSingleSelect = (CCEditSingleSelect *)self.editEnter;
    
    id optionResult = nil;
    
    NSInteger optionIndex = indexPath.row;
    
    if (editSingleSelect.cleanOptionString && optionIndex == 0) {
        optionResult = nil;
    }
    
    if (editSingleSelect.cleanOptionString)optionIndex -= 1;
    
    if (optionIndex >= 0) {
        if (editSingleSelect.isObjectOption) {
            optionResult = [NSString stringWithFormat:@"%@",[self.optionsArray[optionIndex] valueForKey:editSingleSelect.selectPropertyName]];
        }
        else{
            optionResult = self.optionsArray[optionIndex];
        }
    }
    
    if (editSingleSelect.stringResult) {
        
        editSingleSelect.stringResult(optionResult);
    }
    else if (editSingleSelect.objResult){
        //给所传对象 需要修改的属性 赋值
        [editSingleSelect.editObj setValue:optionResult forKey:editSingleSelect.editPropertyName];
        editSingleSelect.objResult(editSingleSelect.editObj);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}



@end
