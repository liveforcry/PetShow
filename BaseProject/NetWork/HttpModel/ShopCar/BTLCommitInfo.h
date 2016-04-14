//
//  BTLCommitInfo.h
//  QiPeiPu
//
//  Created by cheng on 16/3/24.
//  Copyright © 2016年 YC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTLCommitData.h"

@interface BTLCommitInfo : NSObject

@property(nonatomic, strong) BTLCommitData *data;
@property (nonatomic, copy) NSString  *msg;

@property(nonatomic, copy) NSString *state;

@end
/*
 openid:null
 cartIdStr:776039
 memo:
 receName:发
 mp: 都是
 provinceId:11
 cityId:330100
 countyId:784
 townId:330102003
 receAddr:浙江杭州市上城区湖滨街道的
 couponId:0
 title:null
 taxpayerIdentificationNo:null
 depositBank:null
 bankAccount:null
 registrationAddress:null
 enterpriseEstablishAccountPic:null
 taxRegisterPic:null
 businessLicensePic:null
 */
/*
 {"msg":"创建订单成功","data":{"money":3109.00,"orderId":"290501","orderNo":"O290501"},"state":0}
 */