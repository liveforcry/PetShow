//
//  BTLMineOrder.h
//  QiPeiPu
//
//  Created by baturu on 16/4/8.
//  Copyright © 2016年 YC. All rights reserved.
//

#import <Foundation/Foundation.h>
//我的订单模型
@class BTLMineOrderData;
@interface BTLMineOrder : NSObject

@property (nonatomic, assign) NSInteger state;

@property (nonatomic, strong) NSArray<BTLMineOrderData *> *data;

@end
@interface BTLMineOrderData : NSObject

@property (nonatomic, assign) NSInteger deliveryState;

@property (nonatomic, assign) NSInteger orderId;

@property (nonatomic, copy) NSString *carDisplayName;

@property (nonatomic, assign) long long expiredTime;

@property (nonatomic, copy) NSString *allPartsName;

@property (nonatomic, copy) NSString *orderNo;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *statusName;

@property(nonatomic,assign)CGFloat height;

@end

