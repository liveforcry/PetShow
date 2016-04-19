//
//  ShopSuggestCell.m
//  petShow
//
//  Created by baturu on 16/4/15.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "ShopSuggestCell.h"
#import "PetShopModel.h"
#import "PetShopViewModel.h"
#import "shopDetailViewController.h"
@interface ShopSuggestCell ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@end
@implementation ShopSuggestCell
-(void)dealWithDataCell1 : (PetShopViewModel *)PetVM row : (NSInteger)row{
    self.phtot = PetVM.ZuiXinArr;
}
- (void)setPhtot:(NSArray *)phtot
{
    
    _phtot = phtot;
    _phtotCount = phtot.count;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionVeiw reloadData];
    });

}

#pragma mark <UICollectionViewDataSource>
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _phtotCount;
    
}
//四周边距

-(UIEdgeInsets )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 5, 0, 5);
}
//行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
//列间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
//每个Cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(140, 140);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collOne" forIndexPath:indexPath];
    UIImageView *shopPhtotImg = [cell viewWithTag:100];
    UILabel *shopNameLb = [cell viewWithTag:200];
    UILabel *shopScoreLb = [cell viewWithTag:300];

    ShopData *data = self.phtot[indexPath.row];
    [shopPhtotImg  setImageWithURL: [NSURL URLWithString:data.icon] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    shopNameLb.text = data.name;
    shopScoreLb.text = [NSString stringWithFormat:@"%ld",data.coinCount];
    return cell;
}
//点击了触发
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ShopData *data = self.phtot[indexPath.row];
    NSString *path = [NSString stringWithFormat:@"http://score.yc.cn/store/goods.do?id=%ld",data.goodsId];
    NSURL *pathUrl = [NSURL URLWithString:path];
//    shopDetailViewController *shopVc = [[shopDetailViewController alloc]initWithURL:pathUrl];
//    if ([self.delegate respondsToSelector:@selector(gotoDetailGoods:url:)]) {
        [self.delegate gotoDetailGoods:self url:pathUrl];
//    }
    
    
}
@end
