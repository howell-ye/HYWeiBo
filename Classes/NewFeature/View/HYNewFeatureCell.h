//
//  HYNewFeatureCell.h
//  HYWeiBo
//
//  Created by yehowell on 15/11/23.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYNewFeatureCell : UICollectionViewCell

@property(nonatomic,strong)UIImage *image;

-(void)setIndexPath:(NSIndexPath *)indexPath count:(int)count;

@end
