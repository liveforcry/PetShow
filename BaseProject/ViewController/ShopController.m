//
//  ShopController.m
//  petShow
//
//  Created by baturu on 16/4/15.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "ShopController.h"
#import "PetShopViewModel.h"
#import "ShopSuggestCell.h"
#import "iCarousel.h"
#import "makeOwnCell.h"
#import "shopAllViewCell.h"
#import "shopDetailViewController.h"
#define kScreenWith [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ShopController ()<iCarouselDataSource,iCarouselDelegate,shopSuggestCellDelegate,shopAllViewCellDelegate>
@property(nonatomic,strong)PetShopViewModel *PetVM;
@property(nonatomic,assign)CGFloat height;
//@property (weak, nonatomic) IBOutlet UICollectionView *collection;

//@property(nonatomic,strong)UICollectionView *collection;
@end
#define magin  10
@implementation ShopController
{//添加成员变量,因为不需要懒加载,所以不需要是属性
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
}
#pragma mark gotoDetailGoodsDelegate     for suggestGoods
-(void)gotoDetailGoods:(ShopSuggestCell *)cell url:(id)url{
    shopDetailViewController *shopVc = [[shopDetailViewController alloc]initWithURL:url];
    [self.navigationController pushViewController:shopVc animated:YES];
}

//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//      NSLog(@"self.petVM.rownubmer = %ld",self.PetVM.rowNumber);
//    return self.PetVM.rowNumber;
//}
//- (UICollectionView *)collection {
//    if(_collection == nil) {
//        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//        CGFloat width = (kWindowW - magin) / 2;
//        CGFloat height = width * 678 / 487;
//        layout.itemSize = CGSizeMake(width,height);
//        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//        layout.minimumInteritemSpacing = magin;
//        layout.minimumLineSpacing = magin;
//        _collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kWindowW,kWindowH - 30) collectionViewLayout:layout];
//        _collection.dataSource = self;
//        _collection.delegate = self;
//        _collection.scrollEnabled= NO;
//        self.tableView.tableFooterView =_collection;
//        _collection.backgroundColor = [UIColor lightGrayColor];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.collection reloadData];
//        });
//      
//    }
//    return _collection;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = (kWindowW - 3 * magin) / 2;
    CGFloat height = width * 678 / 487;
    self.height = height;
 
    self.tableView.tableHeaderView = [self headerView];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.PetVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
//            
//            UINib *nib = [UINib nibWithNibName:@"makeOwnCell"
//                                        bundle: [NSBundle mainBundle]];
//            [self.collection registerNib:nib forCellWithReuseIdentifier:@"cellOwn"];
//
        }];
    }];
    if (self.PetVM.flag) {
        self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.PetVM getMoreDataCompletionHandle:^(NSError *error) {
                [self.tableView.footer endRefreshing];
                [self.tableView reloadData];
                
            }];
        }];
    }
   
    self.tableView.tableFooterView = [UIView new];
    [self.tableView.header beginRefreshing];

//    self.tableView.frame = CGRectMake(0, 0, kWindowW, kWindowH+ 1000);
    
}

- (PetShopViewModel *)PetVM {
    if(_PetVM == nil) {
        _PetVM = [[PetShopViewModel alloc] init];
    }
    return _PetVM;
}


//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    makeOwnCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellOwn" forIndexPath:indexPath];
//    [cell.imageView setImageWithURL:[self.PetVM getPhotosUrlForRow:indexPath.row
//                                   ] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
//    cell.nameLb.text = [self.PetVM getUserNickForRow:indexPath.row];
//    cell.scoreLb.text = [self.PetVM getMoneyForRow:indexPath.row];
//    
//    return cell;
//}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        ShopSuggestCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"tablecell1"];
        cell1.delegate = self;
        [cell1 dealWithDataCell1:self.PetVM row:indexPath.section];
         return cell1;
    }else{
        shopAllViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"tablecell2"];
         cell2.delegate = self;
          [cell2 dealWithDataCell2:self.PetVM row:indexPath.section];
         return cell2;
    }
    
    
    return nil;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
    
        return self.PetVM.rowNumber / 2 * (self.height + magin) + magin;
       
    }
    return 145;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
         return 30;
    }
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 30;
    }
    return 0.001;
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section == 0) {
         return @"全部商品";
    }
    return nil;
   
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"最新推荐";
    }
    return nil;
    
}
-(UIView *)headerView{
    [_timer invalidate];
    //头部视图origin无效,宽度无效,肯定是与table同宽
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, 0, kWindowW/750 * 400 )];
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
