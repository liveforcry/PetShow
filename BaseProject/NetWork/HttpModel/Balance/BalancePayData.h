//
//  BalancePayData.h
//  QiPeiPu
//
//  Created by cheng on 16/3/29.
//  Copyright © 2016年 YC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BalancePayData : NSObject
@property (nonatomic, copy) NSString  *money;
@property (nonatomic, copy) NSDictionary  *packetMap;
@property (nonatomic, copy) NSString  *payInfo;

@end
// {"data":{"money":7.00,"packetMap":{},"payInfo":""},"state":0}