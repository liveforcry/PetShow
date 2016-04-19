//
//  shoppingViewController.m
//  petShow
//
//  Created by baturu on 16/4/19.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "shoppingViewController.h"
#import "PetShopViewModel.h"
#import "ShopSuggestCell.h"
#import "PetShopModel.h"
#import "PetShopViewModel.h"
#import "iCarousel.h"
#import "makeOwnCell.h"
#import "shopAllViewCell.h"
#import "shopDetailViewController.h"
#define magin 5
@interface shoppingViewController ()<iCarouselDataSource,iCarouselDelegate,UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionvuew;
@property(nonatomic,strong)PetShopViewModel *PetVM;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(nonatomic,strong)UIScrollView *scrollview;
@property(nonatomic,assign)CGFloat height;
@end

@implementation shoppingViewController
{//添加成员变量,因为不需要懒加载,所以不需要是属性
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
}
- (PetShopViewModel *)PetVM {
    if(_PetVM == nil) {
        _PetVM = [[PetShopViewModel alloc] init];
    }
    return _PetVM;
}

- (UIScrollView *)scrollview {
    if(_scrollview == nil) {
        _scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, self.height)];
//        _scrollview.contentSize = CGSizeMake(0, self.height - 100);
        _scrollview.bounces = NO;
        
        //设置整页滚动
        _scrollview.pagingEnabled = NO;
        
        //设置水平滚动条不可见
        _scrollview.showsVerticalScrollIndicator = YES;
        _scrollview.showsHorizontalScrollIndicator = NO;
        _scrollview.scrollEnabled = YES;
    }
    return _scrollview;
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
//    self.scrollview.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-44);
    self.scrollview.contentSize = CGSizeMake(kWindowW, self.height - 100);
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.tableview.tableHeaderView = [self headerView];
    
//    [_collectionvuew removeFromSuperview];
//    [_tableview removeFromSuperview];
//    for (int i  = 0; i < self.view.subviews.count; i++) {
//        NSLog(@"subview = %@",self.view.subviews[i]);
//    }
    CGRect rect = self.view.frame;
     NSLog(@"begin = %lf %lf %lf %lf",rect.size.width,rect.size.height,rect.origin.x,rect.origin.y);
    CGFloat height = rect.size.height + kWindowH;
    self.height = height;
    rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, height);
    self.view.frame = rect;
   NSLog(@"end = %lf %lf %lf %lf",self.view.frame.size.width,self.view.frame.size.height,self.view.frame.origin.x,self.view.frame.origin.y);
    [self.view addSubview:self.scrollview];
//    [_scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(0);
//    }];
    [self.scrollview addSubview:self.tableview];
    [self.scrollview addSubview:self.collectionvuew];
//    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.left.mas_equalTo(0);
//        make.top.mas_equalTo(self.tableview.tableHeaderView);
//        make.height.mas_equalTo(kWindowW/750 * 400 + 145 + 60);
//    }];
//    [self.collectionvuew mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.left.bottom.mas_equalTo(0);
//        make.top.mas_equalTo(self.tableview);
//        
//    }];
     self.tableview.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.PetVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableview.header endRefreshing];
            [self.tableview reloadData];
            [self.collectionvuew reloadData];
        }];
    }];
    self.collectionvuew.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.PetVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.collectionvuew.footer endRefreshing];
            [self.collectionvuew reloadData];
            
        }];
    }];
  
    [self.tableview.header beginRefreshing];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.PetVM.rowNumber;
    
}
//四周边距

-(UIEdgeInsets )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(magin, magin, magin, magin);
}
//行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
//列间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return magin;
}
//每个Cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kWindowW - 3 * magin) / 2;
    CGFloat height = width * 678 / 487;
    return CGSizeMake(width, height );
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"colltwo" forIndexPath:indexPath];
    UIImageView *shopPhtotImg = [cell viewWithTag:100];
    UILabel *shopNameLb = [cell viewWithTag:200];
    UILabel *shopScoreLb = [cell viewWithTag:300];
    ShopData *data = self.PetVM.dataArr[indexPath.row];
    [shopPhtotImg  setImageWithURL: [NSURL URLWithString:data.icon] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    shopNameLb.text = data.name;
    shopScoreLb.text = [NSString stringWithFormat:@"%ld",data.coinCount];
    return cell;
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

        ShopSuggestCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"tablecell1"];
      cell1.delegate = self;
        [cell1 dealWithDataCell1:self.PetVM row:indexPath.row];
    
        return cell1;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 145;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
  
        return 30;
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
        return 30;
  
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
   
        return @"全部商品";
   
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
   
        return @"最新推荐";
    
    
}

#pragma  mark 添加广告栏
-(UIView *)headerView{
    [_timer invalidate];
    //头部视图origin无效,宽度无效,肯定是与table同宽
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, kWindowW/750 * 400)];
    //添加底部视图
    UIView *botoomView = [UIView new];
    botoomView.backgroundColor = kRGBColor(240, 240, 240);
    [headView addSubview:botoomView];
    [botoomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(20);
    }];
    _titleLb = [UILabel new];
    [botoomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = 3;
    [botoomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.top.mas_equalTo(0);
    }];
    //    _titleLb.text = @"测试 看效果";
    //添加滚动栏
    _ic = [iCarousel new];
    [headView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(botoomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;
    //如果只有一张图,则不显示圆点
    _pageControl.hidesForSinglePage = YES;
    //如果只有一张图,则不可以滚动
    _pageControl.pageIndicatorTintColor = [UIColor redColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
        [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
    } repeats:YES];
    //小圆点 不能与用户交互
    _pageControl.userInteractionEnabled = NO;
    return headView;
}
#pragma mark - iCarousel Delegate
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 3;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750 * 400 - 20)];
        
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    NSString *imagePath = [NSString stringWithFormat:@"shop%ld",index + 1];
    imageView.image = [UIImage imageNamed:imagePath];
    return view;
}

/** 允许循环滚动 */
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

/** 监控当前滚到到第几个 */
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    
    //    _titleLb.text = [self.tuwanVM titleForRowInIndexPic:carousel.currentItemIndex];
    _pageControl.currentPage = carousel.currentItemIndex;
}



@end
