//
//  BTLOrderData.h
//  QiPeiPu
//
//  Created by cheng on 16/1/3.
//  Copyright © 2016年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTLOrderData : NSObject
@property(nonatomic, copy) NSString *allPartsName;
@property(nonatomic, copy) NSString *allowExchangeGoods;
@property(nonatomic, copy) NSString *allowReturnGoods;
@property(nonatomic, copy) NSString *carDisplayName;
@property(nonatomic, copy) NSArray *carTypeVOList;
@property(nonatomic, copy) NSString *couponAmount;
@property(nonatomic, copy) NSString *exchangeGoodsList;
@property(nonatomic, copy) NSString *expiredTime;
@property(nonatomic, copy) NSString *invuiceBankAccount;
@property(nonatomic, copy) NSString *invuiceDepositBank;
@property(nonatomic, copy) NSString *invuiceRegistrationAddress;
@property(nonatomic, copy) NSString *invuiceRegistrationPhone;
@property(nonatomic, copy) NSString *invuiceTaxpayerIdentificationNo;
@property(nonatomic, copy) NSString *invuiceTitle;
@property(nonatomic, copy) NSString *invuiceType;
@property(nonatomic, copy) NSString *memo;
@property(nonatomic, copy) NSString *orderDeliveryVOList;
@property(nonatomic, copy) NSString *orderDetailTotalCount;
@property(nonatomic, copy) NSString *orderId;
@property(nonatomic, copy) NSString *orderNo;
@property(nonatomic, copy) NSString *personAddress;
@property(nonatomic, copy) NSString *personMobile;
@property(nonatomic, copy) NSString *personName;
@property(nonatomic, copy) NSString *personTel;
@property(nonatomic, copy) NSString *publishTime;
@property(nonatomic, copy) NSString *returnGoodsList;
@property(nonatomic, copy) NSString *sendGoodsStateName;
@property(nonatomic, copy) NSString *status;
@property(nonatomic, copy) NSString *statusName;
@property(nonatomic, copy) NSString *totalAmount;



@end
