//
//  BTLConfirmOrderInfo.h
//  QiPeiPu
//
//  Created by cheng on 15/12/21.
//  Copyright © 2015年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTLConfirmOrderData.h"

@interface BTLConfirmOrderInfo : NSObject

@property (nonatomic, strong) BTLConfirmOrderData  *result;
@property (nonatomic, copy) NSString  *state;
@property (nonatomic, copy) NSString  *msg;


@end
