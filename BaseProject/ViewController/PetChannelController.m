//
//  PetChannelController.m
//  petShow
//
//  Created by baturu on 16/4/14.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "PetChannelController.h"
#import "PetChannelViewModel.h"
#import "PetChannelCell.h"
@interface PetChannelController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)PetChannelViewModel *PetChanVM;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PetChannelController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.PetChanVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.PetChanVM getMoreDataCompletionHandle:^(NSError *error) {
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

kRemoveCellSeparator
#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.PetChanVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString  *cellIndenty = @"channelCell";
    NSInteger row = indexPath.row;
    PetChannelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndenty forIndexPath:indexPath];
    [cell.usetPhotoImg setImageWithURL:[self.PetChanVM getUsersUrlForRow:row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    cell.titleLB.text = [self.PetChanVM getUserNickForRow:row];
    [cell.userLevImg setImageWithURL:[self.PetChanVM getUsersLevUrlForRow:row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
     [cell.userLastImg setImageWithURL:[self.PetChanVM getUsersLasetUrlForRow:row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    cell.contentNumLB.text = [self.PetChanVM getUsersContentNumForRow:row];
    return cell;
    
    return nil;
}

- (PetChannelViewModel *)PetChanVM {
	if(_PetChanVM == nil) {
		_PetChanVM = [[PetChannelViewModel alloc] init];
	}
	return _PetChanVM;
}

@end
