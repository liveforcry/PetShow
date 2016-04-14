//
//  WXPaySDK.h
//  QiPeiPu
//
//  Created by cheng on 16/2/19.
//  Copyright © 2016年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "PacketMap.h"
#import "WXPaySDKData.h"

@interface WXPaySDK : NSObject
//@property (nonatomic, copy) NSString  *orderId;
//@property (nonatomic, copy) NSString  *orderNo;
//@property (nonatomic, copy) NSString  *actualAmount;
//@property (nonatomic, copy) NSString  *packet;
//@property (nonatomic, copy) NSString  *orderSource;
//@property (nonatomic, copy) PacketMap *packetMap;
//@property (nonatomic, copy) NSString  *success;
//@property (nonatomic, copy) NSString  *errorCode;
//@property (nonatomic, copy) NSString  *errorMsg;
@property (nonatomic, strong) WXPaySDKData *data;
@property (nonatomic, copy) NSString  *state;



@end
