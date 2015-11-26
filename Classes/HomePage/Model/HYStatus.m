//
//  HYStatus.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/24.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYStatus.h"
#import "HYPhoto.h"

@implementation HYStatus

+(NSDictionary *)objectClassInArray
{
    return @{@"pic_urls":[HYPhoto class]};
}

@end
