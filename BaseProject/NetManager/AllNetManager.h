//
//  AllNetManager.h
//  petShow
//
//  Created by baturu on 16/4/6.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "BaseNetManager.h"

@interface AllNetManager : BaseNetManager
//***************主页请求地址****************
//获取所有宠物的信息
+(id)getAllPetsNewsWithPageId :(NSInteger )pageId kComplete;


//获取所有宠物的图片
+(id)getAllPetsPicWithPageId :(NSInteger )pageId kComplete;

//获取所有宠物的频道
+(id)getAllPetsChannelWithPageId :(NSInteger )pageId kComplete;



//***************商城请求地址****************
//获取所有宠物的信息
+(id)getPetsShopWithPageId :(NSInteger)pageId kComplete;




//***************我请求地址****************
@end
