//
//  HYNewFeatureController.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/23.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYNewFeatureController.h"
#import "HYNewFeatureCell.h"

@interface HYNewFeatureController ()

@property(nonatomic, weak)UIPageControl *control;

@end

@implementation HYNewFeatureController



static NSString * const reuseIdentifier = @"Cell";

-(instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:layout];
}



- (void)viewDidLoad {
    [super viewDidLoad];

    [self.collectionView registerClass:[HYNewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    [self setUpPageControl];
}

-(void)setUpPageControl
{
    UIPageControl *control = [[UIPageControl alloc] init];
    control.numberOfPages = 4;
    control.pageIndicatorTintColor = [UIColor blackColor];
    control.currentPageIndicatorTintColor = [UIColor redColor];
    control.center = CGPointMake(self.view.width * 0.5, self.view.height);
    _control = control;
    [self.view addSubview:control];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x/scrollView.bounds.size.width+0.5;
    _control.currentPage = page;
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HYNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    NSString *imageName = [NSString stringWithFormat:@"new_feature_%ld",indexPath.row+1];
    if (screenH > 480) {
        imageName = [NSString stringWithFormat:@"new_feature_%ld_568h",indexPath.row+1];
    }
    cell.image = [UIImage imageNamed:imageName];
    [cell setIndexPath:indexPath count:4];
    
    return cell;
}



@end
