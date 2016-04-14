//
//  AllNetManager.m
//  petShow
//
//  Created by baturu on 16/4/6.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "AllNetManager.h"
#import "AllPetNewsModel.h"
#import "PetPicModel.h"
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

+(id)getAllPetsNewsWithPageId :(NSInteger)pageId kComplete{
    
    NSDictionary *dict = @{setdo,setPhone,setLng,setDevice,setVer,setSystem,setLimit,setLat,@"page_id":@(pageId)};
    
  return  [self GET:BaseAllPetUrl parameters:dict completionHandler:^(id responseObj, NSError *error) {
      
      complete([AllPetNewsModel objectWithKeyValues:responseObj],error);
      
    }];
}
+(id)getAllPetsPicWithPageId :(NSInteger )pageId kComplete{
    NSString *path = nil;
    if (pageId == 1) {
        path = @"http://api2.liuliu.co:6001/cityphoto?json=1&api=1.8&os_version=android_19&version=android_2.8.1&qudao=yingyongbao&carrier=460-00&device_id=B2D3EB05C2200B6EA1C87F9FD38B3B55&_timestamp=1460555845420&_code=310af672a6f2b0a1c5378952ee9caea5&city_id=0&count=24&species=0";
    }else{
        path = @"http://api2.liuliu.co:6001/cityphoto?json=1&api=1.8&os_version=android_19&version=android_2.8.1&qudao=yingyongbao&carrier=460-00&device_id=B2D3EB05C2200B6EA1C87F9FD38B3B55&_timestamp=1460555878950&_code=e63ad05cedcc37e1ee35dcf971034907&city_id=0&count=24&create_time=1.460541076921788E9&last_photo_time=1.460541076921788E9&last_update_time=0.0&species=0";
    }
    return  [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        
        complete([PetPicModel objectWithKeyValues:responseObj],error);
        
    }];
}
@end
