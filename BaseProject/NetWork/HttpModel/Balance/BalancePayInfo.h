//
//  BalancePayInfo.h
//  QiPeiPu
//
//  Created by cheng on 16/3/29.
//  Copyright © 2016年 YC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BalancePayData.h"

@interface BalancePayInfo : NSObject
@property (nonatomic, copy) NSString  *state;
@property (nonatomic, copy) BalancePayData  *data;

@end
// {"data":{"money":7.00,"packetMap":{},"payInfo":""},"state":0}