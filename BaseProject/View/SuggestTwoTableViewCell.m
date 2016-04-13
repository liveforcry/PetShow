//
//  SuggestTwoTableViewCell.m
//  petShow
//
//  Created by baturu on 16/4/12.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "SuggestTwoTableViewCell.h"


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
    [self.PetCollectinView reloadData];
}
-(void)dealWithData : (AllPetsNewsViewModel *)PetVM row : (NSInteger)row{
    self.phtot = PetVM.PhotoArr;
    self.phtotZan = PetVM.PhotoZanArr;
    [self.userPhotoImg setImageWithURL:[PetVM getUsersUrlForRow:row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    self.userNameLb.text = [PetVM getUserTitleForRow:row];
    self.userAddressLb.text = [PetVM getUserAddressForRow:row];
    [self.userLevelImg setImageWithURL:[PetVM getUserLevelForRow:row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    self.petDescLb.text = [PetVM getDecriptionForRow:row];
    self.likeNumLb.text = [PetVM getLikeNumForRow:row];
    self.commNumLb.text = [PetVM getCommentNumForRow:row];
}
#pragma mark <UICollectionViewDataSource>
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.phtot.count;
    
}
- (DataListZan_List *)getDataForRow: (NSInteger)row{
    return _phtotZan[row];
}
-(NSURL *)getZanPhotoUrlForRow :(NSInteger) row{
    return [NSURL URLWithString:[self getDataForRow:row].avatar];
}
-(void)setPhtotZan:(NSArray *)phtotZan{
    _phtotZan = phtotZan;
    _ZanNumber = phtotZan.count;
    [self addImageInZanView];
}
-(void)addImageInZanView{
     NSInteger count = kWindowW / (36 + 10);
    UIView *lastView = nil;
    UIImageView *imageView = nil;
   _ZanNumber = _ZanNumber - count ? count -1 : _ZanNumber;
    if (_ZanNumber) {
        for (int i  = 0; i < _ZanNumber; i++) {
            if (i == 0) {
                lastView = _userZanImg;
                [_userZanImg setImageWithURL:[self getZanPhotoUrlForRow:i]placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
            }else{
                imageView = [[UIImageView alloc]init];
                imageView.layer.cornerRadius = 18;
                imageView.clipsToBounds = YES;
                [self.userZanView addSubview:imageView];
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.height.mas_equalTo(36);
                    make.left.mas_equalTo(lastView.mas_right).mas_equalTo(8);
                    make.centerY.mas_equalTo(_userZanView);
                }];
                [imageView setImageWithURL:[self getZanPhotoUrlForRow:i]placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
                lastView = imageView;
            }
        }
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navigationbar_more"]];
        [self.userZanView addSubview:image];
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(36);
            make.right.mas_equalTo(_userZanView.mas_right).mas_equalTo(-2);
            make.centerY.mas_equalTo(_userZanView);
        }];
        lastView = nil;
    }
}

-(UIImageView *)userZanImg{
    _userZanImg.layer.cornerRadius = 18;
    _userZanImg.clipsToBounds = YES;
    return _userZanImg;
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
