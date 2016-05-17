//
//  MedetilViewController.m
//  petShow
//
//  Created by baturu on 16/4/18.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "MedetilViewController.h"
//#import "Factory.h"
#import "LoginViewController.h"
#define kScreenWith [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#import "LoveDetailViewController.h"
#import "MeViewCell.h"
const CGFloat kNavigationBarHeight = 44;
const CGFloat kStatusBarHeight = 20;
@interface MedetilViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIColor *backColor;
@property (nonatomic, assign) CGFloat headerHeight;

@property (nonatomic, strong) UIView *headerContentView;
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) CGFloat scale;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *iconUrl;
@end

@implementation MedetilViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(instancetype)initWithName: (NSString *)name icon : (NSString *)icon{
    if (self = [super init]) {
        self.name = name;
        self.iconUrl = icon;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];
    self.headerHeight = 260;
    [self.view addSubview:self.tableView];

    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //去掉底部线条
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    //添加背景view
//    CGRect backView_frame = CGRectMake(0, -20, kScreenWith, 20+44);
//    UIView *backView = [[UIView alloc] initWithFrame:backView_frame];
//    UIColor *backColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.4 alpha:0];
//    backView.backgroundColor = [backColor colorWithAlphaComponent:0.3];
//    [self.navigationController.navigationBar addSubview:backView];
//    self.backView = backView;
//    self.backColor = backColor;
    //标题
    self.navigationItem.title = @"个人信息";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    //header
    CGRect bounds = CGRectMake(0, 0, kScreenWith, self.headerHeight);
    UIView *contentView = [[UIView alloc] initWithFrame:bounds];
    contentView.backgroundColor = [UIColor blackColor];
    //背景
    UIImageView *headerImageView = [[UIImageView alloc] init];
    headerImageView.bounds = bounds;
    headerImageView.center = contentView.center;
//    if (_iconUrl) {
//        [headerImageView setImageWithURL:[NSURL URLWithString:_iconUrl] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
//    }else{
    headerImageView.image = [UIImage imageNamed:@"bg+"];
//    }
    contentView.layer.masksToBounds = YES;
    
    self.headerImageView = headerImageView;
    self.headerContentView = contentView;
    [self.headerContentView addSubview:self.headerImageView];
    self.headerContentView.layer.masksToBounds = YES;
    
    //信息内容
    CGRect icon_frame = CGRectMake(12, self.headerContentView.bounds.size.height-80-12, 80, 80);
    UIImageView *icon = [[UIImageView alloc] initWithFrame:icon_frame];
    icon.backgroundColor = [UIColor clearColor];
    if (_iconUrl) {
        [icon setImageWithURL:[NSURL URLWithString:_iconUrl] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    }else{
        icon.image = [UIImage imageNamed:@"AppIcon57x57"];

    }
    icon.layer.cornerRadius = 80/2.0f;
    icon.layer.masksToBounds = YES;
    icon.layer.borderWidth = 1.0f;
    icon.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.headerContentView addSubview:icon];
    self.icon = icon;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(108, self.headerContentView.bounds.size.height-60-12, kScreenWith-108-12, 50)];
    label.text = self.name;
    
    label.textColor = [UIColor purpleColor];
    label.font = [UIFont systemFontOfSize:15];
    label.numberOfLines = 0;
    self.label = label;
    [self.headerContentView addSubview:self.label];
    
    
    UIView *headerView = [[UIView alloc] initWithFrame:bounds];
    [headerView addSubview:self.headerContentView];
    self.tableView.tableHeaderView = headerView;;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset_Y = scrollView.contentOffset.y;
    CGFloat alpha = (offset_Y + 40)/300.0f;
    self.backView.backgroundColor = [self.backColor colorWithAlphaComponent:alpha];
    
    if (offset_Y < -64) {
        //放大比例
        CGFloat add_topHeight = -(offset_Y+kNavigationBarHeight+kStatusBarHeight);
        self.scale = (self.headerHeight+add_topHeight)/self.headerHeight;
        //改变 frame
        CGRect contentView_frame = CGRectMake(0, -add_topHeight, kScreenWith, self.headerHeight+add_topHeight);
        self.headerContentView.frame = contentView_frame;
        CGRect imageView_frame = CGRectMake(-(kScreenWith*self.scale-kScreenWith)/2.0f,
                                            0,
                                            kScreenWith*self.scale,
                                            self.headerHeight+add_topHeight);
        self.headerImageView.frame = imageView_frame;
        
        CGRect icon_frame = CGRectMake(12, self.headerContentView.bounds.size.height-80-12, 80, 80);
        self.icon.frame = icon_frame;
        
        self.label.frame = CGRectMake(108, self.headerContentView.bounds.size.height-60-12, kScreenWith-108-12, 50);
        
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }else if (section == 1){
        return 4;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MeViewCell" owner:self options:nil]lastObject];
    }
   
    UIImageView *image = cell.image;
    UILabel *label = cell.label;
    if (indexPath.section ==1) {
        if (indexPath.row == 0) {
            image.image = [UIImage imageNamed:@"expert_doctor_icon"];
            label.text = @"医生看看";
        }else if (indexPath.row == 1){
            image.image = [UIImage imageNamed:@"expert_modelling_icon"];
            label.text = @"我要造型";
        }else if (indexPath.row == 2){
            image.image = [UIImage imageNamed:@"expert_nutrition_icon"];
            label.text = @"我要营养";
        }else{
            image.image = [UIImage imageNamed:@"fatherday_15"];
            label.text = @"爱心";
        }
    }
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            image.image = [UIImage imageNamed:@"adminalbumsDefault"];
            label.text = @"我的相册";
        }else if (indexPath.row == 1){
            image.image = [UIImage imageNamed:@"admintvDefault"];
            label.text = @"我的宠币";
        }else if (indexPath.row == 2){
            image.image = [UIImage imageNamed:@"adopt_basicInfo_icon"];
            label.text = @"我的帖子";
        }else{
            image.image = [UIImage imageNamed:@"adopt_origin_icon"];
            label.text = @"设置";
        }
    }
    if (indexPath.section == 2) {
        image.image = [UIImage imageNamed:@"activity_offline_icon"];
        label.text = @"退出账号";
    }
    return cell;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        
        CGRect tableView_frame = CGRectMake(0, -64, kScreenWith, kScreenHeight+kNavigationBarHeight+kStatusBarHeight);
        _tableView = [[UITableView alloc] initWithFrame:tableView_frame style:UITableViewStyleGrouped];
//        [_tableView registerClass:[MeViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    
    return _tableView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1 && indexPath.row == 3) {
        LoveDetailViewController *loveVc = [[LoveDetailViewController alloc]initWithURL:[NSURL URLWithString:@"http://www.yc.cn/app/commonweal/index.html?petTitle=%E5%88%86%E4%BA%AB&petCallback=petHtmlShare&petVer=220&petPlat=1&sessionKey=f035917ca9419f17000064c8ac0c92fd"]];
        [self.navigationController pushViewController:loveVc animated:YES];
    }
    if (indexPath.section == 2) {
        LoginViewController *loginVc = [kStoryboard(@"Main") instantiateViewControllerWithIdentifier:@"loginVc"];
        [self.navigationController pushViewController:loginVc animated:YES];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48;
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
