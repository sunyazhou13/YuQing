//
//  MainNewsViewController.m
//  yuqing2
//
//  Created by wangshun on 15/5/27.
//  Copyright (c) 2015年 wangshun. All rights reserved.
//

#import "MainNewsViewController.h"

#import "NewDetailViewController.h"

@interface MainNewsViewController ()

@end

@implementation MainNewsViewController

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [_moreBtn setImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    DeviceType type =  [Function currentDevice];
    
    if (type == iphone4s) {
        [self.bgImgView setImage:[UIImage imageNamed:@"Mainbg640960"]];
    }
    else if (type == iphone5s){
        [self.bgImgView setImage:[UIImage imageNamed:@"Mainbg6401136"]];
    }
    else if(type == iphone6){
        [self.bgImgView setImage:[UIImage imageNamed:@"Mainbg7501334"]];
    }
    else if(type == iphone6p){
        [self.bgImgView setImage:[UIImage imageNamed:@"Mainbg12422208"]];
    }
    
    mainView = [[MainView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height-160)];
    
    mainView.delegate = self;
    
    [self.view addSubview:mainView];
    
    if (!mainListRequest) {
        mainListRequest = [[NewsRequest alloc] initWithDelegate:self];
    }
    
    [mainListRequest getMainNewsList];
}


#pragma mark - mainView Delegate

- (void)enterFunctinList{
    
    UIStoryboard* story = [UIStoryboard storyboardWithName:@"News" bundle:[NSBundle mainBundle]];
    
    UIViewController* vc = [story instantiateViewControllerWithIdentifier:@"NewListFunction"];
    
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)enterNewDetail:(NSString *)news_id{
    
    UIStoryboard* story = [UIStoryboard storyboardWithName:@"News" bundle:[NSBundle mainBundle]];
    
    NewDetailViewController* vc = [story instantiateViewControllerWithIdentifier:@"NewDetail"];
    
    vc.news_id = news_id;
    
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)enterSetting:(UIButton*)btn{
    
    UIStoryboard* story = [UIStoryboard storyboardWithName:@"Setting" bundle:[NSBundle mainBundle]];
    
    UIViewController* vc = [story instantiateInitialViewController];
    
    [self.navigationController pushViewController:vc animated:YES];
}

//----------------------------------------------------------

#pragma mark - MyRequest Delegate

- (void)MyRequestFinished:(MyRequest *)req{
    
    if(req.resultArr){
        
        NSDictionary* dict = [req.resultArr objectAtIndex:0];
        
        NSArray* arr = [dict objectForKey:@"card"];
        
        [_dataArray addObjectsFromArray:arr];
        
        [mainView refreshData:_dataArray];
    }
}

- (void)MyRequestFailed:(MyRequest *)req Error:(NSError *)error{
  
    
}

//------------------------------------

#pragma mark -

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:YES];
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

- (IBAction)moreClick:(id)sender {

    UIView* view = [[UIView alloc] initWithFrame:self.view.bounds];
    
    view.alpha = 0.4;
    
    [view setBackgroundColor:[UIColor blackColor]];
    
    [self.view addSubview:view];
    
    menuView = [[MenuView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width-140, 60, 120, 140)];
    
    menuView.delegate = self;
    
    [self.view addSubview:menuView];
    
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    
    [view addGestureRecognizer:gesture];
    
}

- (void)tapClick:(UIGestureRecognizer*)g{
    
    UIView* view = [g view];
    
    [view removeFromSuperview];
    
    if ([menuView isDescendantOfView:self.view]) {
        [menuView removeFromSuperview];
    }
}

- (void)menuClick:(UIButton *)b{
    
    
    [self enterSetting:b];
    
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
