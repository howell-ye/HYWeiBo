//
//  HYStatusResult.h
//  HYWeiBo
//
//  Created by yehowell on 15/11/24.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface HYStatusResult : NSObject<MJKeyValue>

@property(nonatomic, strong)NSArray *statuses;

@property(nonatomic,assign)int *total_number;

@end
