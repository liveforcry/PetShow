//
//  PetShopModel.h
//  petShow
//
//  Created by baturu on 16/4/15.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "BaseModel.h"

@class ShopData;
@interface PetShopModel : BaseModel

@property (nonatomic, strong) NSArray<ShopData *> *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface ShopData : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *goodsInfo;

@property (nonatomic, assign) NSInteger repertoryCount;

@property (nonatomic, copy) NSString *statusDesc;

@property (nonatomic, assign) NSInteger coinActivity;

@property (nonatomic, assign) NSInteger isActivity;

@property (nonatomic, copy) NSString *accountExchangeLimit;

@property (nonatomic, assign) long long endTime;

@property (nonatomic, assign) NSInteger coinCount;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) NSInteger goodsId;

@property (nonatomic, assign) long long startTime;

@property (nonatomic, copy) NSString *largeImages;

@end

