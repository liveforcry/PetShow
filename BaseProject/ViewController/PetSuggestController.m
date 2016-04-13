//
//  PetSuggestController.m
//  petShow
//
//  Created by baturu on 16/4/11.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "PetSuggestController.h"
#import "AllPetsNewsViewModel.h"
#import "SuggestOneTableViewCell.h"
#import "SuggestTwoTableViewCell.h"
@interface PetSuggestController ()
@property(nonatomic,strong)AllPetsNewsViewModel *PetVM;
@end

@implementation PetSuggestController
- (AllPetsNewsViewModel *)PetVM {
    if(_PetVM == nil) {
        _PetVM = [[AllPetsNewsViewModel alloc] init];
    }
    return _PetVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.PetVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.PetVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.PetVM.rowNumber;
}
kRemoveCellSeparator
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cell1Id = @"cell1";
    static NSString *cell2Id = @"cell2";
    SuggestOneTableViewCell *cell1 = nil;
    SuggestTwoTableViewCell *cell2 = nil;
    NSInteger row = indexPath.section;
    
    if ([self.PetVM isOnePhotoForRow:indexPath.section]) {  //一张图片就加载cell1
       cell1 = [tableView dequeueReusableCellWithIdentifier:cell1Id forIndexPath:indexPath];
        [cell1.userPhotoImg setImageWithURL:[self.PetVM getUsersUrlForRow:row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
        cell1.userNameLb.text = [self.PetVM getUserTitleForRow:row];
        cell1.userAddressLb.text = [self.PetVM getUserAddressForRow:row];
        [cell1.userLevelImg setImageWithURL:[self.PetVM getUserLevelForRow:row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
        [cell1.petPhotoImg setImageWithURL:[self.PetVM getPetPhotoUrlForRow:row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
        cell1.petDescLb.text = [self.PetVM getDecriptionForRow:row];
        cell1.likeNumLb.text = [self.PetVM getLikeNumForRow:row];
        cell1.commNumLb.text = [self.PetVM getCommentNumForRow:row];
        //给了赞 用户数组 赋值
        
        return cell1;
    }else{        //不是一张图片就加载cell2
        
        cell2 = [tableView dequeueReusableCellWithIdentifier:cell2Id forIndexPath:indexPath];
        cell2.phtot = self.PetVM.PhotoArr;
        [cell2.userPhotoImg setImageWithURL:[self.PetVM getUsersUrlForRow:row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
        cell2.userNameLb.text = [self.PetVM getUserTitleForRow:row];
        cell2.userAddressLb.text = [self.PetVM getUserAddressForRow:row];
        [cell2.userLevelImg setImageWithURL:[self.PetVM getUserLevelForRow:row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
       cell2.petDescLb.text = [self.PetVM getDecriptionForRow:row];
        cell2.likeNumLb.text = [self.PetVM getLikeNumForRow:row];
        cell2.commNumLb.text = [self.PetVM getCommentNumForRow:row];
        
        return cell2;
    }
    
   
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   if ([self.PetVM isOnePhotoForRow:indexPath.section]) {
       return self.PetVM.height;
   }else{
       return self.PetVM.height - 60;
   }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
