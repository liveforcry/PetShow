//
//  PetShopViewModel.m
//  petShow
//
//  Created by baturu on 16/4/15.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "PetShopViewModel.h"
#import "PetShopModel.h"
@implementation PetShopViewModel
//刷新数据
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
    
}
//得到数据
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    
    [AllNetManager getPetsShopWithPageId :_pageId complete:^(PetShopModel *model, NSError *error) {
        if (self.pageId == 1) {
            [self.dataArr removeAllObjects];
            self.dataArr = nil;
        }
        
        self.dataArr = [NSMutableArray arrayWithArray:model.data];
        if (_pageId == 1) {
            self.ZuiXinArr  = model.data;
        }
        completionHandle(error);
    }];
}
//加载更多
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
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
-(ShopData *)getDataListForRow :(NSInteger)row{
    return self.dataArr[row];
    
}

//用户的头像url
-(NSURL *)getPhotosUrlForRow : (NSInteger)row{
     return [NSURL URLWithString:[self getDataListForRow:row].icon];
}
//用户的名称
-(NSString *)getUserNickForRow : (NSInteger)row{
    
    return [self getDataListForRow:row].name;
    
}
//用户的内容个数
-(NSString *)getMoneyForRow : (NSInteger)row{
    return [NSString stringWithFormat:@"%ld",[self getDataListForRow:row].coinCount];
}
@end
