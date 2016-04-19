//
//  PetShopViewModel.h
//  petShow
//
//  Created by baturu on 16/4/15.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "BaseViewModel.h"

@interface PetShopViewModel : BaseViewModel
@property(nonatomic,assign)NSInteger pageId;
//行数
@property(nonatomic,assign)BOOL flag;
@property(nonatomic,strong)NSArray *ZuiXinArr;

@property(nonatomic,assign)NSInteger rowNumber;
//用户的头像url
-(NSURL *)getPhotosUrlForRow : (NSInteger)row;
//用户的名称
-(NSString *)getUserNickForRow : (NSInteger)row;
//用户的内容个数
-(NSString *)getMoneyForRow : (NSInteger)row;

@end
