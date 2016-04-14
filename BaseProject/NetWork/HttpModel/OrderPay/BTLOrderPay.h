//
//  BTLOrderPay.h
//  QiPeiPu
//
//  Created by cheng on 15/12/16.
//  Copyright © 2015年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTLResult.h"
#import "BTLPayData.h"


@interface BTLOrderPay : NSObject

@property (nonatomic, copy) NSString  *msg;

@property (nonatomic, strong) BTLResult  *result;
@property (nonatomic, copy) NSString  *state;
@property (nonatomic, strong) BTLPayData  *data;




@end
