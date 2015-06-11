//
//  NewsListFunctionViewController.m
//  yuqing2
//
//  Created by wangshun on 15/5/25.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "NewsListFunctionViewController.h"

#import "NewsListFunctionCell.h"

#import "NewDetailViewController.h"

@interface NewsListFunctionViewController ()

@end

@implementation NewsListFunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _listArr = [[NSMutableArray alloc] initWithCapacity:0];
    
    isLoading = NO;
    
    if (!login_NewList_Request) {
        login_NewList_Request = [[LoginRequest alloc] initWithDelegate:self];
    }
    
    [login_NewList_Request unLoginList];

    isLoading = YES;
    
    UIImageView* imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.tableView.tableHeaderView.frame.size.height+10)];
    
    [imageview setImage:[UIImage imageNamed:@"3&24头部背景"]];
    
    [self.tableView addSubview:imageview];
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:YES];
    
}

#pragma mark - NetWorking Delegate

- (void)MyRequestFinished:(MyRequest *)req{

    isLoading = NO;
    
    if (req == login_NewList_Request) {
        if (login_NewList_Request.type == LoginUrlTypeUnloginList) {

            id data = req.resultArr;
            
            NSDictionary* dict = [(NSArray*)data objectAtIndex:0];
            
            NSArray* arr = [dict objectForKey:@"list"];
            
            [_listArr addObjectsFromArray:arr];
            
            [_tableView reloadData];

        }
    }
}

- (void)MyRequestFailed:(MyRequest *)req Error:(NSError *)error{
    
    isLoading = NO;
    
    id data = req.resultArr;
    
    if (data && [data isKindOfClass:[NSArray class]]) {
        NSArray* arr = data;
        
        NSDictionary* dict =[arr objectAtIndex:0];
        
        if (dict) {
            [self showHUD:[dict objectForKey:@"message"] isDim:NO afterDelay:1];
        }
    }
    
}


#pragma mark - didReceiveMemoryWarning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NewsListFunctionCell* cell = (NewsListFunctionCell*)[tableView cellForRowAtIndexPath:indexPath];
    
    NSString* news_id = [cell.info objectForKey:@"news_id"];
    
    UIStoryboard* story = [UIStoryboard storyboardWithName:@"News" bundle:[NSBundle mainBundle]];
    
    NewDetailViewController* vc = [story instantiateViewControllerWithIdentifier:@"NewDetail"];
    
    vc.news_id = news_id;
    
    [self.navigationController pushViewController:vc animated:YES];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsListFunctionCell* cell = [tableView dequeueReusableCellWithIdentifier:@"NewListCell" forIndexPath:indexPath];
    
    NSDictionary* dict = [_listArr objectAtIndex:indexPath.row];
    
    [cell setContent:dict WithFrame:tableView.frame];
    
    return cell;
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
