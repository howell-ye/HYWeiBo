//
//  HYUserResult.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/25.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYUserResult.h"

@implementation HYUserResult

- (int)messageCount
{
    return _cmt + _dm + _mention_cmt + _mention_status;
}

- (int)totoalCount
{
    return self.messageCount + _status + _follower;
}

@end
