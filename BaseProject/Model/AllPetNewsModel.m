//
//  AllPetNewsModel.m
//  petShow
//
//  Created by baturu on 16/4/6.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "AllPetNewsModel.h"

@implementation AllPetNewsModel

@end

@implementation Data

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [DataList class]};
}

@end


@implementation DataRmdUsers

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [DataRmdUserList class]};
}

@end


@implementation DataRmdUserList

@end


@implementation DataList

+ (NSDictionary *)objectClassInArray{
    return @{@"zan_list" : [DataListZan_List class], @"photo" : [DataListPhoto class]};
}

- (CGFloat)height{
    if (_height == 0) {
        NSDictionary *attribute = @{NSFontAttributeName :[UIFont systemFontOfSize:14]};
        
        CGRect rectDis = [self.photo_des boundingRectWithSize:CGSizeMake(kWindowW - 10 - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    
        return _height + rectDis.size.height  + 322;
    }
    return _height;
}
@end


@implementation DataListChannelInfo

@end


@implementation DataListUserInfo

@end


@implementation DataListPhotoDesFormat

@end


@implementation DataListExtra

@end


@implementation DataListPetInfo

@end


@implementation DataListZan_List

@end


@implementation DataListPhoto

@end


