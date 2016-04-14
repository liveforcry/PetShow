//
//  BTLHelpMeMakingOfferInfo.m
//  QiPeiPu
//
//  Created by cheng on 15/12/29.
//  Copyright © 2015年 BTL. All rights reserved.
//

#import "BTLHelpMeMakingOfferInfo.h"
//#import "BTLHelpMeMakingOfferData.h"

@implementation BTLHelpMeMakingOfferInfo

+ (NSDictionary *)objectClassInArray
{
    return @{@"data":[BTLHelpMeMakingOfferData class]};
}

- (NSInteger)count
{
    if (self.data) {
        return self.data.count;
    }
    return 0;
}

@end
