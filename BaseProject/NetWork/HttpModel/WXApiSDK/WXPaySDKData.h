//
//  WXPaySDKData.h
//  QiPeiPu
//
//  Created by cheng on 16/2/24.
//  Copyright © 2016年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PacketMap.h"

@interface WXPaySDKData : NSObject
@property (nonatomic, copy) NSString  *money;
@property (nonatomic, strong) PacketMap  *packetMap;
@property (nonatomic, copy) NSString  *payInfo;



@end
