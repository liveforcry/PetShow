//
//  OrderCardPayInfo.h
//  QiPeiPu
//
//  Created by cheng on 15/12/22.
//  Copyright © 2015年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderCardPayData.h"

@interface OrderCardPayInfo : NSObject

@property (nonatomic, strong) OrderCardPayData  *data;// result;
@property (nonatomic, copy) NSString  *state;
@property (nonatomic, copy) NSString  *msg;



/*
{
    "msg": "获取银联流水号成功",
    " result ": {
        "money": 56.6,
        "payInfo": "201505201014060062352"
    },
    "state": 0
}
*/

@end
