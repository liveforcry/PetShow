//
//  AllPetsNewsViewModel.h
//  petShow
//
//  Created by baturu on 16/4/7.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "BaseViewModel.h"

@interface AllPetsNewsViewModel : BaseViewModel
@property(nonatomic,assign)NSInteger pageId;
//行数
@property(nonatomic,assign)NSInteger rowNumber;
//cell高度
@property(nonatomic,assign)CGFloat height;
//图片数组
@property(nonatomic,strong)NSArray *PhotoArr;
//图片几张
@property(nonatomic,assign)NSInteger PhtotCount;
//赞了用户数组
@property(nonatomic,strong)NSArray *PhotoZanArr;
//赞了用户几张
@property(nonatomic,assign)NSInteger PhtotZanCount;
//设置标示为判断是否有赞此说说
@property(nonatomic,assign)BOOL hasZan;
//用户的头像url
-(NSURL *)getUsersUrlForRow : (NSInteger)row;
//用户的标题
-(NSString *)getUserTitleForRow :(NSInteger)row;
//用户的地址
-(NSString *)getUserAddressForRow :(NSInteger)row;

-(NSString *)getUserppidForRow :(NSInteger)row;
-(NSString *)getPetPhotoStrForRow :(NSInteger)row;
//用户的等级
-(NSURL *)getUserLevelForRow :(NSInteger)row;
////宠物的类名
//-(NSString *)getPetNameForRow :(NSInteger)row;
////宠物的名字
//-(NSString *)getPetPtNameForRow :(NSInteger)row;
//是否是一张图片
-(BOOL)isOnePhotoForRow :(NSInteger)row;
////宠物类名中的图片
//-(NSURL *)getPetInfoPhotoUrlForRow :(NSInteger)row;
//获取用户发的图片
-(NSURL *)getPetPhotoUrlForRow :(NSInteger)row;
//用户的描述
-(NSString *)getDecriptionForRow :(NSInteger)row;
//赞的数量
-(NSString *)getLikeNumForRow :(NSInteger)row;
//评论的数量
-(NSString *)getCommentNumForRow :(NSInteger)row;
//获取赞的用户的数组
- (NSArray *)GetPhotoZanArrFroRow :(NSInteger) row;


@end
