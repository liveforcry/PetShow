//
//  PetPicController.m
//  petShow
//
//  Created by baturu on 16/4/14.
//  Copyright © 2016年 shenyi. All rights reserved.
//

#import "PetPicController.h"
#import "PetPicViewModel.h"
#import "petPicCell.h"
#define magin 5
@interface PetPicController ()<UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)PetPicViewModel *picVM;
@end

@implementation PetPicController

static NSString * const reuseIdentifier = @"picCell";
- (PetPicViewModel *)picVM {
    if(_picVM == nil) {
        _picVM = [[PetPicViewModel alloc] init];
    }
    return _picVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.picVM refreshDataCompletionHandle:^(NSError *error) {
            [self.collectionView reloadData];
            [self.collectionView.header endRefreshing];
        }];
    }];
    self.collectionView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.picVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.collectionView reloadData];
            [self.collectionView.footer endRefreshing];
        }];
    }];
    
//    [self.collectionView registerClass:[UICollectionViewCell  class] forCellWithReuseIdentifier:@"picCell"];
    [self.collectionView.header beginRefreshing];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    
//}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.picVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    petPicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.petPhotoImg setImageWithURL:[self.picVM getUsersUrlForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
 
    cell.userLevelImg.image = [UIImage imageNamed:[self.picVM getUserLeveForRow:indexPath.row]];
    cell.userScoreLb.text = [self.picVM getUsersScoreForRow:indexPath.row];
    cell.userNickLb.text = [self.picVM getUserNickForRow:indexPath.row];
    return cell;
}


#pragma mark <UICollectionViewDelegateFlowLayout>
//每个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        NSInteger width  = kWindowW ;
        
        NSInteger height = width* 250 / 400;
        
        return  CGSizeMake(width, height);
    }else if (indexPath.row == 1 || indexPath.row == 2){
        NSInteger width  = (kWindowW  -   magin) / 2;
        
        NSInteger height = width* 312 / 400;
        
        return  CGSizeMake(width, height);
    }else{
        NSInteger width  = (kWindowW  - 2 * magin) / 3;
//          NSLog(@"width =  %lf window w = %lf",width,kWindowW);
        NSInteger height = width* 312 / 400;
        
        return  CGSizeMake(width, height);
    }
    

}
//四周边缘
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(magin + 44, 0, magin, 0);
}
//行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return magin;
}
//列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return magin;
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/


@end
