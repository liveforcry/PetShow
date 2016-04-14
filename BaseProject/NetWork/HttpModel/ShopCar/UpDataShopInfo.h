//
//  UpDataShopInfo.h
//  QiPeiPu
//
//  Created by cheng on 16/3/11.
//  Copyright © 2016年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "UpDataShopData.h"

@interface UpDataShopInfo : NSObject
//{"msg":"更新购物车数量失败","state":-1}
@property (nonatomic, copy) NSString  *msg;
@property (nonatomic, copy) NSString  *state;

@end
