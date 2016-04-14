//
//  BTLOrderInfo.h
//  QiPeiPu
//
//  Created by cheng on 16/1/3.
//  Copyright © 2016年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTLOrderData.h"

@interface BTLOrderInfo : NSObject
@property(nonatomic, strong) BTLOrderData *data;
@property(nonatomic, copy) NSString *stata;
@end
