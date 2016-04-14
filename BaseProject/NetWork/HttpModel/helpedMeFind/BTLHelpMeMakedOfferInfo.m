//
//  BTLHelpMeMakedOfferInfo.m
//  QiPeiPu
//
//  Created by cheng on 16/1/17.
//  Copyright © 2016年 BTL. All rights reserved.
//

#import "BTLHelpMeMakedOfferInfo.h"

@implementation BTLHelpMeMakedOfferInfo

+ (NSDictionary *)objectClassInArray
{
    return @{@"data":[BTLHelpMeMakedOfferData class]};
}

- (NSInteger)count
{
    if (self.data) {
        return self.data.count;
    }
    return 0;
}


@end
