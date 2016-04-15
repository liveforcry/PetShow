//
//  ShopTableViewController.m
//  petShow
//
//  Created by baturu on 16/4/15.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "ShopTableViewController.h"
#import "PetShopViewModel.h"
#import "iCarousel.h"
#import "ShopSuggestCell.h"
#import "ShopAllCell.h"
@interface ShopTableViewController ()<iCarouselDelegate,iCarouselDataSource>
@property(nonatomic,strong)PetShopViewModel *PetVM;
@end

@implementation ShopTableViewController
{//添加成员变量,因为不需要懒加载,所以不需要是属性
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
}

- (PetShopViewModel *)PetShopVM {
    if(_PetVM == nil) {
        _PetVM = [[PetShopViewModel alloc] init];
    }
    return _PetVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.PetShopVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.PetShopVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];
    
}

/** 头部滚动视图 */

-(UIView *)headerView{
    [_timer invalidate];
     //头部视图origin无效,宽度无效,肯定是与table同宽
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, kWindowW/750 * 500)];
    //添加底部视图
    UIView *botoomView = [UIView new];
    botoomView.backgroundColor = kRGBColor(240, 240, 240);
    [headView addSubview:botoomView];
    [botoomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
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
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(-10);
    }];
    _titleLb.text = @"测试 看效果";
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
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750 * 500 - 35)];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 1;
    }
//    return self.PetShopVM.rowNumber;
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ShopSuggestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"suggest3" forIndexPath:indexPath];
        cell.phtot = self.PetShopVM.ZuiXinArr;
    }
    ShopAllCell *cell = [tableView dequeueReusableCellWithIdentifier:@"suggest4" forIndexPath:indexPath];
    cell.phtot = self.PetShopVM.dataArr;
    
    return nil;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"最新推荐";
    }
    return @"全部商品";
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
