//
//  BTLShopCarInfo.h
//  QiPeiPu
//
//  Created by cheng on 15/12/15.
//  Copyright © 2015年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTLShopCarData.h"

@interface BTLShopCarInfo : NSObject

@property(nonatomic, copy) NSArray *result;
@property (nonatomic, copy) NSString  *state;
@property (nonatomic, copy) NSString  *msg;

@property (copy, nonatomic) NSString *totalMoney;

@property (assign, nonatomic) NSInteger totalCount;

@property (assign, nonatomic) NSInteger allCount;

@property(nonatomic, assign)  BOOL flag;
//@property (nonatomic, strong) BTLNilShop *data;


@end
// 下面是 delete 的数据
//"data":{"errorCode":0,"errorMsg":"","model":1,"success":true},"state":0}