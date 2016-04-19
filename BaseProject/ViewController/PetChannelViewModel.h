//
//  PetChannelViewModel.h
//  petShow
//
//  Created by baturu on 16/4/14.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "BaseViewModel.h"

@interface PetChannelViewModel : BaseViewModel
@property(nonatomic,assign)NSInteger pageId;
//行数
@property(nonatomic,assign)BOOL flag;

@property(nonatomic,assign)NSInteger rowNumber;
//用户的头像url
-(NSURL *)getUsersUrlForRow : (NSInteger)row;
//用户的等级url
-(NSURL *)getUsersLevUrlForRow : (NSInteger)row;
//用户的名称
-(NSString *)getUserNickForRow : (NSInteger)row;
//用户的内容个数
-(NSString *)getUsersContentNumForRow : (NSInteger)row;
//用户的最后一张url
-(NSURL *)getUsersLasetUrlForRow : (NSInteger)row;

@end
