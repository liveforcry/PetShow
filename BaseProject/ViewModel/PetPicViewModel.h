//
//  PetPicViewModel.h
//  petShow
//
//  Created by baturu on 16/4/13.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "BaseViewModel.h"

@interface PetPicViewModel : BaseViewModel
@property(nonatomic,assign)NSInteger pageId;
//行数
@property(nonatomic,assign)NSInteger rowNumber;
//用户的头像url
-(NSURL *)getUsersUrlForRow : (NSInteger)row;
//用户的名称
-(NSString *)getUserNickForRow : (NSInteger)row;
//用户的积分
-(NSString *)getUsersScoreForRow : (NSInteger)row;
//用户的等级
-(NSString * )getUserLeveForRow : (NSInteger)row;

@end
