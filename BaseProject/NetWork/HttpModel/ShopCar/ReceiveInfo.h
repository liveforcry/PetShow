//
//  ReceiveInfo.h
//  QiPeiPu
//
//  Created by cheng on 16/3/11.
//  Copyright © 2016年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReceiveData.h"

@interface ReceiveInfo : NSObject
@property (nonatomic, strong) ReceiveData  *result;
@property (nonatomic, copy) NSString  *state;
@property(nonatomic, copy) NSString *msg;

@end
