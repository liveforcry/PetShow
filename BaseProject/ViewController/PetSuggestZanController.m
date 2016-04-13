//
//  PetSuggestZanController.m
//  petShow
//
//  Created by baturu on 16/4/13.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "PetSuggestZanController.h"
#import "ZanCell.h"
#import "AllPetNewsModel.h"
@interface PetSuggestZanController ()

@end

@implementation PetSuggestZanController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
  
}
- (DataListZan_List *)getDataForRow: (NSInteger)row{
    return _ZanDataArr[row];
}
-(NSURL *)getZanPhotoUrlForRow :(NSInteger) row{
    return [NSURL URLWithString:[self getDataForRow:row].avatar];
}
-(NSString *)getZanNameForRow :(NSInteger) row{
    return [self getDataForRow:row].nickname;
}
-(NSURL *)getZanLevelForRow :(NSInteger) row{
    return [NSURL URLWithString:[self getDataForRow:row].level_icon];
}
-(NSString *)getZanAddressForRow :(NSInteger) row{
    return [self getDataForRow:row].address;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.ZanDataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString  *cellIndenty = @"zanCell";
    NSInteger row = indexPath.row;
    ZanCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndenty forIndexPath:indexPath];
    [cell.ZanUsetImg setImageWithURL:[self getZanPhotoUrlForRow:row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    cell.ZanUserNameLb.text = [self getZanNameForRow:row];
    [cell.ZanUserLevLb setImageWithURL:[self getZanLevelForRow:row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    cell.ZanUserAddreLb.text = [self getZanAddressForRow:row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
