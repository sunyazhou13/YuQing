//
//  LoginViewController.m
//  yuqing2
//
//  Created by wangshun on 15/5/17.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "LoginViewController.h"

#import "AppDelegate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)awakeFromNib {
     [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     
     _listArr = [[NSMutableArray alloc] initWithCapacity:0];

     [self.loginBtn.layer setMasksToBounds:YES];
     [self.loginBtn.layer setCornerRadius:3.0]; //设置矩形四个圆角半径
     [self.loginBtn.layer setBorderWidth:1.0]; //边框宽度
     [self.loginBtn.layer setBorderColor:[UIColor whiteColor].CGColor];
     
     NSString* placeholder = @"用户名/邮箱/手机";
     
     UIColor *color = [UIColor whiteColor];
     
     NSMutableAttributedString* str = [[NSMutableAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName:color}];
     
     [_nameField setAttributedPlaceholder:str];
     
     placeholder = @"登录密码";
     
     color = [UIColor whiteColor];
     
     str = [[NSMutableAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName:color}];
     
     [_psdField setAttributedPlaceholder:str];
     
     [self.bgScrollView setUserInteractionEnabled:YES];
     
     [self.bgView setUserInteractionEnabled:YES];
     [self.bgView setBackgroundColor:[UIColor clearColor]];
     
     UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
     
     [self.bgView addGestureRecognizer:tap];
     
     if (!login_Request) {
          login_Request = [[LoginRequest alloc] initWithDelegate:self];
     }
     
     [login_Request unLoginList];
     
     isLoading = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
     
     [self.navigationController.navigationBar setHidden:YES];
}

#pragma mark - NetWorking Delegate

- (void)MyRequestFinished:(MyRequest*)req{

     isLoading = NO;
     
     id data = req.resultArr;
     
     if (req == login_Request) {
          
          switch (login_Request.type) {
               case LoginUrlTypeLogin:
               {
                    NSDictionary* userInfo = [(NSArray*)data objectAtIndex:0];
                    
                    NSString* userID = [userInfo objectForKey:@"customer_id"];
                    
                    [[NSUserDefaults standardUserDefaults] setObject:userID forKey:UserID];
                    
                    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:IsLogin];
                    
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    
                    NSString* path = [[self documentPath] stringByAppendingPathComponent:@"userInfo.plist"];
                    
                    [userInfo writeToFile:path atomically:YES];
                    
                    AppDelegate* app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
                    
                    [app loginSuccessed];
                    
               }
                    break;
               case LoginUrlTypeUnloginList:
               {
                    NSDictionary* dict = [(NSArray*)data objectAtIndex:0];
                    
                    NSArray* arr = [dict objectForKey:@"list"];
                    
                    [_listArr addObjectsFromArray:arr];
                    
                    [_tableView reloadData];
               }
                    break;
                    
               default:
                    break;
          }
          
     }
     
}

- (void)MyRequestFailed:(MyRequest*)req Error:(NSError *)error{
     
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

#pragma mark - UITapGestureRecognizer tabClick:
-(void)tapClick:(UIGestureRecognizer*)gesture{

     [self resignAllFirstResponder];
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
     
     UIStoryboard* newsStory = [UIStoryboard storyboardWithName:@"News" bundle:[NSBundle mainBundle]];
     
     UIViewController* vc = [newsStory instantiateViewControllerWithIdentifier:@"NewListFunction"];
     
     [self.navigationController pushViewController:vc animated:YES];
     
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return _listArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     NSString* identifier = @"login_Table_Cell";
     
     UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
     
     [cell.textLabel setTextColor:[UIColor whiteColor]];
     
     NSDictionary* dict= [_listArr objectAtIndex:indexPath.row];
     
     [cell.textLabel setText:[dict objectForKey:@"title"]];
     
     return cell;
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
     //[self resignAllFirstResponder];//因scrollview scrolling enable = NO 和tableview手势冲突
}

#pragma mark - didReceiveMemoryWarning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ResignFirstResponder

- (void)resignAllFirstResponder {
     [self.nameField resignFirstResponder];
     [self.psdField resignFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated{
     [super viewWillDisappear:animated];
     [self.navigationController.navigationBar setHidden:NO];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
     return UIStatusBarStyleLightContent;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - loginClick 登录

- (IBAction)loginClick:(id)sender {
    
     NSString* username = [self.nameField text];
     
     NSString* psd = [self.psdField text];
     
     if (isLoading) {
          return;
     }
     
     [login_Request login:@{@"username":username,@"password":psd}];
     
     [login_Request start];
     
}


@end
