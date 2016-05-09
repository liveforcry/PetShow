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
#import "PetSuggestZanController.h"
#import "UMSocial.h"
@interface PetSuggestController ()<UMSocialUIDelegate,UMSocialDataDelegate>
@property(nonatomic,strong)AllPetsNewsViewModel *PetVM;
@property(nonatomic,assign)NSInteger clickRow;

@end

@implementation PetSuggestController

- (AllPetsNewsViewModel *)PetVM {
    if(_PetVM == nil) {
        _PetVM = [[AllPetsNewsViewModel alloc] init];
    }
    return _PetVM;
}

- (IBAction)gotoZanVc:(id)sender {
    PetSuggestZanController *zanVc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ZanVc"];
    zanVc.ZanDataArr = self.PetVM.PhotoZanArr;
    [self.navigationController pushViewController:zanVc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tabBarController.hidesBottomBarWhenPushed = YES;
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

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.tableView.frame = CGRectMake(0, 44, kWindowW, kWindowH - 44);
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(60, 0, 0, 0);
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
    
    if ([self.PetVM isOnePhotoForRow:row]) {  //一张图片就加载cell1
       cell1 = [tableView dequeueReusableCellWithIdentifier:cell1Id forIndexPath:indexPath];
        UILabel *shareLb =  [cell1 viewWithTag:500];
        UIImageView  *image =  [cell1 viewWithTag:400];
        image.userInteractionEnabled = YES;
        shareLb.userInteractionEnabled = YES;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(share:)];
        [shareLb addGestureRecognizer:gesture];
        [image addGestureRecognizer:gesture];
        [cell1 dealWithData :self.PetVM row:row];
       self.clickRow = row;
        return cell1;
    }else{        //不是一张图片就加载cell2
        
        cell2 = [tableView dequeueReusableCellWithIdentifier:cell2Id forIndexPath:indexPath];
        UILabel *shareLb =  [cell2 viewWithTag:500];
        UIImageView  *image =  [cell2 viewWithTag:400];
        image.userInteractionEnabled = YES;

        shareLb.userInteractionEnabled = YES;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(share:)];
        [shareLb addGestureRecognizer:gesture];
        [cell2 dealWithData :self.PetVM row:row];
        [image addGestureRecognizer:gesture];
        self.clickRow = row;
       return cell2;
    }
    
   
    return nil;
}
-(void)share :(UIGestureRecognizer *)gesture {
    NSString *shareUrl =   [self.PetVM getUserppidForRow:_clickRow];
    
    [UMSocialData defaultData].extConfig.wechatSessionData.url = [NSString stringWithFormat:@"http://m.gutou.com/v3/photo.html?do=index&ppid=%@", shareUrl];
    [UMSocialData defaultData].extConfig.wechatSessionData.title = @"微信好友";
   NSString *url =  [self.PetVM getPetPhotoStrForRow:_clickRow];
    
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"572ab2be67e58ea55800000d"
                                      shareText:[self.PetVM getDecriptionForRow:_clickRow]
                                     shareImage:[UIImage imageNamed:url]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToWechatSession,nil]
                                       delegate:self];
    
//    UMSocialUrlResource *urlResource = [[UMSocialUrlResource alloc] initWithSnsResourceType:UMSocialUrlResourceTypeImage url:url
//                                       ];
//    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToSina,UMShareToWechatSession] content:[self.PetVM getDecriptionForRow:_clickRow] image:nil location:nil urlResource:urlResource presentedController:self completion:^(UMSocialResponseEntity *shareResponse){
//        if (shareResponse.responseCode == UMSResponseCodeSuccess) {
//            NSLog(@"分享成功！");
//        }
//    }];

}
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   if ([self.PetVM isOnePhotoForRow:indexPath.section]) {
       return self.PetVM.height;
   }else{
       return self.PetVM.height + 131 - kWindowW;
   }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
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
