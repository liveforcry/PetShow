//
//  SuggestOneTableViewCell.m
//  petShow
//
//  Created by baturu on 16/4/12.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "SuggestOneTableViewCell.h"
#import "PetSuggestZanController.h"
@implementation SuggestOneTableViewCell

- (void)awakeFromNib {

}
- (DataListZan_List *)getDataForRow: (NSInteger)row{
    return _phtotZan[row];
}
-(void)dealWithData : (AllPetsNewsViewModel *)PetVM row : (NSInteger)row{
    self.phtotZan = PetVM.PhotoZanArr;
    [self.userPhotoImg setImageWithURL:[PetVM getUsersUrlForRow:row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    self.userNameLb.text = [PetVM getUserTitleForRow:row];
    self.userAddressLb.text = [PetVM getUserAddressForRow:row];
    [self.userLevelImg setImageWithURL:[PetVM getUserLevelForRow:row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    [self.petPhotoImg setImageWithURL:[PetVM getPetPhotoUrlForRow:row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    self.petDescLb.text = [PetVM getDecriptionForRow:row];
    self.likeNumLb.text = [PetVM getLikeNumForRow:row];
    self.commNumLb.text = [PetVM getCommentNumForRow:row];
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
    _PetPhotoConstraint.constant = kWindowW;
    NSInteger count = kWindowW / (36 + 10);
    UIView *lastView = nil;
    UIImageView *imageView = nil;
    if (_ZanNumber >= count ) {
        _ZanNumber = count - 1;
    }
    if (_ZanNumber) {
        for (int i  = 0; i < _ZanNumber; i++) {
            if (i == 0) {
                lastView = _userZanIma;
                [_userZanIma setImageWithURL:[self getZanPhotoUrlForRow:i]placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
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
- (IBAction)GotoSuggestDetail:(id)sender {
    PetSuggestZanController *zanVc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ZanVc"];
    zanVc.ZanDataArr = self.phtotZan;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UIImageView *)userZanIma{
    _userZanIma.layer.cornerRadius = 18;
    _userZanIma.clipsToBounds = YES;
    return _userZanIma;
}
-(UIImageView *)userPhotoImg{
    _userPhotoImg.layer.cornerRadius = 20;
    _userPhotoImg.clipsToBounds = YES;

    return _userPhotoImg;
}
- (UIImageView *)petPhotoImg{
//    
    _petPhotoImg.contentMode = 2;
    _petPhotoImg.clipsToBounds = YES;
    return _petPhotoImg;
}
@end
