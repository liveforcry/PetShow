//
//  shopAllViewCell.m
//  petShow
//
//  Created by baturu on 16/4/19.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "shopAllViewCell.h"
#import "PetShopModel.h"
#import "PetShopViewModel.h"
#define magin 5
@interface shopAllViewCell ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@end
@implementation shopAllViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)dealWithDataCell2 : (PetShopViewModel *)PetVM row : (NSInteger)row{
    self.phtot = PetVM.dataArr;
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
    return CGSizeMake(width, height);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"colltwo" forIndexPath:indexPath];
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
