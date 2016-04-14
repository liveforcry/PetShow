//
//  PayResult.h
//  QiPeiPu
//
//  Created by cheng on 16/1/11.
//  Copyright © 2016年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PayResult : NSObject
@property(nonatomic, assign) NSInteger channel;
@property(nonatomic, copy) NSString *memo;
@property(nonatomic, copy) NSString *result;
@property(nonatomic, copy) NSString *resultStatus;
@end
