//
//  PetChannelCell.h
//  petShow
//
//  Created by baturu on 16/4/14.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PetChannelCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *usetPhotoImg;


@property (weak, nonatomic) IBOutlet UIImageView *userLastImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UIImageView *userLevImg;

@property (weak, nonatomic) IBOutlet UILabel *contentNumLB;
@end
