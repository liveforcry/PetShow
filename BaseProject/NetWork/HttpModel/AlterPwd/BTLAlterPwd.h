//
//  BTLAlterPwd.h
//  BTLqipeipu
//
//  Created by cheng on 15/12/9.
//  Copyright © 2015年 baturu.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTLAlterPwd : NSObject

// 修改密码的属性
@property (nonatomic, copy) NSString *alterOldPwd;
@property (nonatomic, copy) NSString *alterNewPwd;

@property (nonatomic, copy) NSString  *state;
@property (nonatomic, copy) NSString *msg;

@end
