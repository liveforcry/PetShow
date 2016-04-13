//
//  SuggestOneTableViewCell.m
//  petShow
//
//  Created by baturu on 16/4/12.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "SuggestOneTableViewCell.h"

@implementation SuggestOneTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _PetPhotoConstraint.constant = kWindowW;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UIImageView *)userPhotoImg{
    _userPhotoImg.layer.cornerRadius = 20;
    _userPhotoImg.clipsToBounds = YES;

    return _userPhotoImg;
}
- (UIImageView *)petPhotoImg{
    
    _petPhotoImg.contentMode = 2;
    _petPhotoImg.clipsToBounds = YES;
    return _petPhotoImg;
}
@end
