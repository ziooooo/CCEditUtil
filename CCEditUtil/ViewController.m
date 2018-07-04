//
//  ViewController.m
//  CCEditUtil
//
//  Created by ziooooo on 2017/4/28.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "ViewController.h"
#import "CCEditUtil.h"
#import "User.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *sloganLabel;

@property (strong, nonatomic) User *user;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CCEditUtil";
    self.user = [[User alloc] init];
    self.user.name = @"Jack";
    self.user.gender = @"Man";
    self.user.slogan = @"just do it.";
    
    [self updateUserInfo];
    
}

- (void)updateUserInfo {
    self.nameLabel.text = self.user.name;
    self.genderLabel.text = self.user.gender;
    self.sloganLabel.text = self.user.slogan;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) { //Edit Name
        CCEditSingleEnter *enter = [[CCEditSingleEnter alloc] init];
        enter.currentController = self;
        enter.controllerTitle = @"Edit Name";
        enter.placeholder = @"Please enter your name.";
        enter.currentText = self.user.name;
        [enter cc_setRegexString:@"[a-zA-z ]{1,20}" result:^(NSString *result) {
            NSLog(@"Validation fails");
        }];
        [enter cc_editWtihObject:self.user editPropertyName:@"name" result:^(id obj) {
            [self updateUserInfo];
        }];
    }
    else if (indexPath.row == 1) { //Edit Grender
        CCEditSingleSelect *enter = [[CCEditSingleSelect alloc] init];
        enter.currentController = self;
        enter.controllerTitle = @"Edit Grender";
        enter.optionsArray = @[@"Man", @"Woman", @"Other"];
        enter.cleanOptionString = @"Secret";
        enter.currentOptionString = self.user.gender;
        [enter cc_editWtihResult:^(NSString *result) {
            self.user.gender = result;
            [self updateUserInfo];
        }];
    }
    else if (indexPath.row == 2) { //Edit Slogan
        CCEditMultiEnter *enter = [[CCEditMultiEnter alloc]init];
        enter.currentController = self;
        enter.controllerTitle = @"Edit Slogan";
        enter.placeholder = @"Please enter your slogan.";
        enter.currentText = self.user.slogan;
        [enter cc_setRegexString:@"^.{5,50}$" result:^(NSString *result) {
            NSLog(@"Validation fails");
        }];
        [enter cc_editWtihObject:self.user editPropertyName:@"slogan" result:^(id obj) {
            [self updateUserInfo];
        }];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}


@end
