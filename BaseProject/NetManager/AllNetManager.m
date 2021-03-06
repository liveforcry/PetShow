//
//  AllNetManager.m
//  petShow
//
//  Created by baturu on 16/4/6.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "AllNetManager.h"
#import "AllPetNewsModel.h"
#import "PetChannelModel.h"
#import "PetPicModel.h"
#import "PetShopModel.h"
#define BaseAllPetUrl  @"http://api.gutou.com/v3/main.html"
#define setdo          @"do" :     @"index"
#define setPhone       @"_phone" : @"m1%20note"
#define setLng         @"_lng" : @"113.276445"
#define setDevice      @"_device" : @"ANDROID"
#define setVer         @"_ver" : @"3.02"
#define setSystem      @"_system" : @"4.4.4"
#define setLimit       @"page_limit" : @"10"
#define setLat         @"_lat" : @"23.17583"


@implementation AllNetManager

//***************主页请求地址****************

+(id)getAllPetsNewsWithPageId :(NSInteger)pageId kComplete{
    
    NSDictionary *dict = @{setdo,setPhone,setLng,setDevice,setVer,setSystem,setLimit,setLat,@"page_id":@(pageId)};
    
  return  [self GET:BaseAllPetUrl parameters:dict completionHandler:^(id responseObj, NSError *error) {
      
      complete([AllPetNewsModel objectWithKeyValues:responseObj],error);
      
    }];
}

+(id)getAllPetsPicWithPageId :(NSInteger )pageId kComplete{
        NSString *path = [NSString stringWithFormat:@"http://apiv3.ixingji.com/ixingji/ifollow/followtops.json?client=Android&pname=X27A_331_B_206&appid=27&lgg=0&pmtfs=300-550&uid=15235799&sid=928&appid=27&start=%ld&token=ulsdW8yVYy1Hy2M8&size=30",pageId];
    return   [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
         complete([PetPicModel objectWithKeyValues:responseObj],error);
    }];
}
//获取所有宠物的频道
+(id)getAllPetsChannelWithPageId :(NSInteger )pageId kComplete{
    NSString *path = [NSString stringWithFormat:@"http://api.gutou.com/v3/channel.html?do=getlist&limit=10&_lng=113.27656&_device=ANDROID&_ver=3.02&sort=2&page=%ld&_system=4.4.4&_lat=23.175742&type=0",pageId];
    return   [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        complete([PetChannelModel objectWithKeyValues:responseObj],error);
    }];
}


//***************商城请求地址****************

//获取所有宠物的信息
+(id)getPetsShopWithPageId :(NSInteger)pageId kComplete{
    NSString *path = [NSString stringWithFormat:@"http://score.yc.cn/store/data.do?page=%ld&size=10&type=1",pageId];
   
 return  [self GetMakeOwn:path parameters:nil completeHandle:^(id responseObj, NSError *error) {
     
       complete([PetShopModel objectWithKeyValues:responseObj],error);
     
 }];
        
    


}






@end
