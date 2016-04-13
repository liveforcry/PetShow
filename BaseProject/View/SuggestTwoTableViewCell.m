//
//  SuggestTwoTableViewCell.m
//  petShow
//
//  Created by baturu on 16/4/12.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "SuggestTwoTableViewCell.h"
#import "AllPetNewsModel.h"

@interface SuggestTwoTableViewCell ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@end
#define magin 10
@implementation SuggestTwoTableViewCell

- (void)awakeFromNib {
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    [flowLayout setItemSize:CGSizeMake(88, 88)];
//    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
//    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
//    flowLayout.minimumLineSpacing = 0;
//    flowLayout.minimumInteritemSpacing = 0;
    
    
//    [_PetCollectinView setCollectionViewLayout:flowLayout];
   
}
-(instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (void)setPhtot:(NSArray *)phtot
{
    _phtot = phtot;
//    self.PetCollectinView.delegate = self;
//    self.PetCollectinView.dataSource = self;
    [self.PetCollectinView reloadData];
}
#pragma mark <UICollectionViewDataSource>
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.phtot.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collCell" forIndexPath:indexPath];
    UIImageView *image = (UIImageView *)[cell viewWithTag:100];

    DataListPhoto *phtot =  self.phtot[indexPath.row];
    [image  setImageWithURL: [NSURL URLWithString:phtot.url] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    
    return cell;
}
- (UICollectionView *)PetCollectinView{
    _PetCollectinView.userInteractionEnabled = YES;
    _PetCollectinView.scrollEnabled = YES;
    _PetCollectinView.backgroundColor = [UIColor whiteColor];
    return _PetCollectinView;
}
-(UIImageView *)userPhotoImg{
    _userPhotoImg.layer.cornerRadius = 20;
    _userPhotoImg.clipsToBounds = YES;
    
    return _userPhotoImg;
}
//四周边距

-(UIEdgeInsets )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(2, 5, 2, 5);
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

    return CGSizeMake(135, 131);
}

@end
