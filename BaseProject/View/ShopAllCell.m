//
//  ShopAllCell.m
//  petShow
//
//  Created by baturu on 16/4/15.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "ShopAllCell.h"

#import "PetShopViewModel.h"
@interface ShopAllCell ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property(nonatomic,strong)PetShopViewModel *PetShopVm;
@end
@implementation ShopAllCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setPhtot:(NSArray *)phtot
{
    _phtot = phtot;
    
    [self.collectionVeiw reloadData];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (UICollectionView *)collectionVeiw{
    _collectionVeiw.userInteractionEnabled = YES;
    _collectionVeiw.scrollEnabled = YES;
    _collectionVeiw.backgroundColor = [UIColor lightGrayColor];
    return _collectionVeiw;
}
#pragma mark <UICollectionViewDataSource>
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.phtot.count;
    
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
    
    return CGSizeMake(165, 165);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    ShopAllCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"suggest2" forIndexPath:indexPath];
//    
//    [cell.shopPhotoImg  setImageWithURL: [self.PetShopVm getPhotosUrlForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
//    cell.shopNameLb.text = [self.PetShopVm getUserNickForRow:indexPath.row];
//    cell.shopScoreLb.text = [self.PetShopVm getMoneyForRow:indexPath.row];
    return nil;
}



- (PetShopViewModel *)PetShopVm {
    if(_PetShopVm == nil) {
        _PetShopVm = [[PetShopViewModel alloc] init];
    }
    return _PetShopVm;
}


@end
