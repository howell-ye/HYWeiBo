//
//  HYStatusCell.h
//  HYWeiBo
//
//  Created by yehowell on 15/11/27.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HYStatusFrame;

@interface HYStatusCell : UITableViewCell

@property(nonatomic, strong)HYStatusFrame *statusF;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
