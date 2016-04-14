//
//  BTLPirmeInfo.h
//  QiPeiPu
//
//  Created by cheng on 16/3/25.
//  Copyright © 2016年 YC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTLPirmeData.h"

@interface BTLPirmeInfo : NSObject

@property(nonatomic, copy) NSString *msg;
@property(nonatomic, copy) NSArray *result;
@property(nonatomic, copy) NSString *totalSize;
@property(nonatomic, copy) NSString *state;

@end
