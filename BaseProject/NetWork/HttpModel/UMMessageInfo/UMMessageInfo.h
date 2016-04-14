//
//  UMMessageInfo.h
//  QiPeiPu
//
//  Created by cheng on 16/3/14.
//  Copyright © 2016年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UMMessageData.h"

@interface UMMessageInfo : NSObject

@property (nonatomic, strong) UMMessageData  *aps;
@property (nonatomic, copy) NSString  *d;
@property (nonatomic, copy) NSString  *p;
@property (nonatomic, copy) NSString  *type;



@end
