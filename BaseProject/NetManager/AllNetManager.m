//
//  AllNetManager.m
//  petShow
//
//  Created by baturu on 16/4/6.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "AllNetManager.h"
#import "AllPetNewsModel.h"

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

@end
