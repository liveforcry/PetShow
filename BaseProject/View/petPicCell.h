//
//  petPicCell.h
//  petShow
//
//  Created by baturu on 16/4/14.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface petPicCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *petPhotoImg;
@property (weak, nonatomic) IBOutlet UIImageView *userLevelImg;

@property (weak, nonatomic) IBOutlet UILabel *userNickLb;
@property (weak, nonatomic) IBOutlet UILabel *userScoreLb;
@end
