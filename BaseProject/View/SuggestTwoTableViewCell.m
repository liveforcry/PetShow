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

    return 1;
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
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
    if (_ZanNumber >= count ) {
        _ZanNumber = count - 1;
    }
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
    image.tag = indexPath.section;
    image.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [image addGestureRecognizer:gesture];
    DataListPhoto *phtot =  self.phtot[indexPath.section];
    [image  setImageWithURL: [NSURL URLWithString:phtot.url] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    
    return cell;
}
-(void)tap : (UIGestureRecognizer *)gesture{
        UIImageView *image = (UIImageView *)gesture.view;
        NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < self.phtot.count; i++) {
            MJPhoto *photo = [[MJPhoto alloc]init];
            DataListPhoto *phtotUrl =  self.phtot[i];
            photo.url = [NSURL URLWithString:phtotUrl.url];
            photo.srcImageView = image;
            photo.index = i  ;
        
            [array addObject:photo];
        
        }

        MJPhotoBrowser *broswer = [[MJPhotoBrowser alloc]init];
        broswer.photos = array;
        broswer.currentPhotoIndex = image.tag;
        [broswer show];
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

    return CGSizeMake(131, 128);
}

@end
