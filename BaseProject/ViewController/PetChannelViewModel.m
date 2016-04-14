//
//  PetChannelViewModel.m
//  petShow
//
//  Created by baturu on 16/4/14.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "PetChannelViewModel.h"
#import "PetChannelModel.h"

@implementation PetChannelViewModel
//刷新数据
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
    
}
//得到数据
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    
    [AllNetManager getAllPetsChannelWithPageId:_pageId complete:^(PetChannelModel *model, NSError *error) {
        if (self.pageId == 1) {
            [self.dataArr removeAllObjects];
            self.dataArr = nil;
        }
        self.dataArr = [NSMutableArray arrayWithArray:model.data.list];
     
        completionHandle(error);
    }];
}
//加载更多
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    UIButton *bu = nil;
    [bu bk_addEventHandler:^(id sender) {
        
    } forControlEvents:UIControlEventTouchUpInside];
    _pageId += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
    if (_pageId == 4) {
        UIAlertView *alett = [[UIAlertView alloc]initWithTitle:@"消息" message:@"没有数据了,刷新吧" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"返回", nil];
        [alett show];
    }
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
//获取每一行的数据
-(ChannelList *)getDataListForRow :(NSInteger)row{
    return self.dataArr[row];
    
}


//用户的头像url
-(NSURL *)getUsersUrlForRow : (NSInteger)row{
    return [NSURL URLWithString:[self getDataListForRow:row].cover];
}
//用户的等级url
-(NSURL *)getUsersLevUrlForRow : (NSInteger)row{
    return [NSURL URLWithString:[self getDataListForRow:row].s_icon];
}
//用户的名称
-(NSString *)getUserNickForRow : (NSInteger)row{
    return [self getDataListForRow:row].title;
}
//用户的内容个数
-(NSString *)getUsersContentNumForRow : (NSInteger)row{
    return [self getDataListForRow:row].note;
}
//用户的最后一张url
-(NSURL *)getUsersLasetUrlForRow : (NSInteger)row{
    return [NSURL URLWithString:[self getDataListForRow:row].last_photo];
}
@end
