//
//  SuggestOneTableViewCell.h
//  petShow
//
//  Created by baturu on 16/4/12.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuggestOneTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *PetPhotoConstraint;

@property (weak, nonatomic) IBOutlet UIImageView *userPhotoImg;

@property (weak, nonatomic) IBOutlet UILabel *userNameLb;
@property (weak, nonatomic) IBOutlet UILabel *userAddressLb;

@property (weak, nonatomic) IBOutlet UIImageView *userLevelImg;

@property (weak, nonatomic) IBOutlet UIImageView *petPhotoImg;

@property (weak, nonatomic) IBOutlet UILabel *petDescLb;


@property (weak, nonatomic) IBOutlet UILabel *likeNumLb;

@property (weak, nonatomic) IBOutlet UILabel *commNumLb;
@property (weak, nonatomic) IBOutlet UIView *userZanView;

@property (weak, nonatomic) IBOutlet UIImageView *userZanIma;

@end
