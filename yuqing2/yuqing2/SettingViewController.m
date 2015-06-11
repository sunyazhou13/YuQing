//
//  SettingViewController.m
//  yuqing2
//
//  Created by wangshun on 15/6/9.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "SettingViewController.h"

#import "SettingCell.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Setting" ofType:@"plist"];
    
    _dataArray = [[NSMutableArray alloc] initWithContentsOfFile:path];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:NO];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navi"] forBarMetrics:UIBarMetricsCompact];
}

#pragma mark - tableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.section ==2 && indexPath.row ==0){//关于我们
        [self performSegueWithIdentifier:@"EnterAbout" sender:nil];
    }
    else if(indexPath.section ==1 && indexPath.row ==1){//使用帮助
        [self performSegueWithIdentifier:@"EnterHelp" sender:nil];
    }
    else if(indexPath.section ==1 && indexPath.row ==0){//意见反馈
        [self performSegueWithIdentifier:@"EnterFeedBack" sender:nil];
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray* sections = [_dataArray objectAtIndex:section];
    
    return sections.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* str = @"SettingCell";
    
    SettingCell* cell = [tableView dequeueReusableCellWithIdentifier:str forIndexPath:indexPath];
    
    NSArray* sections = [_dataArray objectAtIndex:indexPath.section];
    
    NSDictionary* e_dict = [sections objectAtIndex:indexPath.row];
    
    [cell setContent:e_dict];
    
    
    return cell;
}

#pragma mark - didReceiveMemoryWarning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
