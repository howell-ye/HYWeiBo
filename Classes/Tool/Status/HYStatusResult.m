//
//  HYStatusResult.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/24.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYStatusResult.h"
#import "HYStatus.h"

@implementation HYStatusResult

+(NSDictionary *)objectClassInArray
{
    return @{@"statuses":[HYStatus class]};
}


@end
