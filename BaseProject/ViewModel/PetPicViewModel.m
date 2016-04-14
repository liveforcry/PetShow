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
@implementation PetPicViewModel
//刷新数据
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
    
}
//得到数据
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    
    [AllNetManager getAllPetsPicWithPageId:_pageId complete:^(PetPicModel *model, NSError *error) {
        if (self.pageId == 1) {
            [self.dataArr removeAllObjects];
            self.dataArr = nil;
        }
        
        self.dataArr = [NSMutableArray arrayWithArray:model.post_list];
       
        completionHandle(error);
    }];
}
//加载更多
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId = 2;
    [self getDataFromNetCompleteHandle:completionHandle];
    
}
//获取每一行的数据
-(Post_List *)getDataListForRow :(NSInteger)row{
    return self.dataArr[row];
    
}
//用户的头像url
-(NSURL *)getUsersUrlForRow : (NSInteger)row{
    return [NSURL URLWithString:[self getDataListForRow:row].user.pic];
}
//宠物的头像url
-(NSURL *)getPetPicUrlForRow : (NSInteger)row{
    return [NSURL URLWithString:[self getDataListForRow:row].pic];
}
@end
