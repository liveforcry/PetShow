//
//  PayResultData.h
//  QiPeiPu
//
//  Created by cheng on 16/1/18.
//  Copyright © 2016年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PayResultData : NSObject
@property (nonatomic, copy) NSString  *partner;
@property (nonatomic, copy) NSString  *seller_id;
@property (nonatomic, copy) NSString  *out_trade_no;
@property (nonatomic, copy) NSString  *subject;
@property (nonatomic, copy) NSString  *body;
@property (nonatomic, copy) NSString  *total_fee;
@property (nonatomic, copy) NSString  *notify_url;
@property (nonatomic, copy) NSString  *service;
@property (nonatomic, copy) NSString  *payment_type;
@property (nonatomic, copy) NSString  *_input_charset;
@property (nonatomic, copy) NSString  *it_b_pay;
@property (nonatomic, copy) NSString  *success;
@property (nonatomic, copy) NSString  *sign_type;
@property (nonatomic, copy) NSString  *sign;

@end
