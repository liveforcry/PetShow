//
//  ReturnFreightInfo.h
//  QiPeiPu
//
//  Created by cheng on 16/3/11.
//  Copyright © 2016年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReturnFreightData.h"

@interface ReturnFreightInfo : NSObject
@property (nonatomic, strong) ReturnFreightData  *data;
@property (nonatomic, copy) NSString  *state;
@property (nonatomic, copy) NSString  *msg;


@end
