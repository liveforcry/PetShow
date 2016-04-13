//
//  ZanCell.h
//  petShow
//
//  Created by baturu on 16/4/13.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZanCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ZanUsetImg;

@property (weak, nonatomic) IBOutlet UILabel *ZanUserNameLb;

@property (weak, nonatomic) IBOutlet UILabel *ZanUserAddreLb;
@property (weak, nonatomic) IBOutlet UIImageView *ZanUserLevLb;

@end
