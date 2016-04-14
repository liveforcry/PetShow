//
//  PetPicViewModel.m
//  petShow
//
//  Created by baturu on 16/4/13.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "PetPicViewModel.h"
#import "AllNetManager.h"
#import "PetPicModel.h"
#import "PetChannelModel.h"
@implementation PetPicViewModel
//刷新数据
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
    
}
//得到数据
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    
    [AllNetManager getAllPetsPicWithPageId :_pageId complete:^(PetPicModel *model, NSError *error) {
        if (self.pageId == 0) {
            [self.dataArr removeAllObjects];
            self.dataArr = nil;
        }
        [self.dataArr addObjectsFromArray:model.attachment.follows];
       
        completionHandle(error);
    }];
}
//加载更多
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
    
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
//获取每一行的数据
-(Follows *)getDataListForRow :(NSInteger)row{
    return self.dataArr[row];
    
}
-(NSURL *)getUsersUrlForRow : (NSInteger)row{
    return [NSURL URLWithString:[self getDataListForRow:row].headFace];
}
//用户的名称
-(NSString *)getUserNickForRow : (NSInteger)row{
    return [self getDataListForRow:row].nick;
}
//用户的积分
-(NSString *)getUsersScoreForRow : (NSInteger)row{
    return [NSString stringWithFormat:@"积分:%ld",[self getDataListForRow:row].score];
}
//用户的等级
-(NSString *)getUserLeveForRow : (NSInteger)row{
    return [NSString stringWithFormat:@"%ld",[self getDataListForRow:row].level];
}
@end
