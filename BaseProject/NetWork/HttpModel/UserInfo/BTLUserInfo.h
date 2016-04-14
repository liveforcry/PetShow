//
//  BTLUserInfo.h
//  QiPeiPu
//
//  Created by cheng on 15/12/12.
//  Copyright © 2015年 BTL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTLUserInfoData.h"


@interface BTLUserInfo : NSObject
@property(nonatomic,copy) NSString *status;
@property(nonatomic,strong) BTLUserInfoData *data;

@end
