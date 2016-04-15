//
//  ShopSuggestCell.m
//  petShow
//
//  Created by baturu on 16/4/15.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "ShopSuggestCell.h"

#import "PetShopViewModel.h"

@interface ShopSuggestCell ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@end
@implementation ShopSuggestCell

- (void)setPhtot:(NSArray *)phtot
{
    _phtot = phtot;
    _phtotCount = phtot.count;
    [self.collectionVeiw reloadData];
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
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"coll1" forIndexPath:indexPath];
    UIImageView *shopPhtotImg = [cell viewWithTag:100];
    UILabel *shopNameLb = [cell viewWithTag:200];
    UILabel *shopScoreLb = [cell viewWithTag:300];
    [shopPhtotImg  setImageWithURL: [self.shopVm getPhotosUrlForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    shopNameLb.text = [self.shopVm getUserNickForRow:indexPath.row];
    shopScoreLb.text = [self.shopVm getMoneyForRow:indexPath.row];
    return cell;
}


@end
