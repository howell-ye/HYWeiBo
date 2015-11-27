//
//  HYStatus.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/24.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYStatus.h"
#import "HYPhoto.h"
#import "NSDate+MJ.h"


@implementation HYStatus

+(NSDictionary *)objectClassInArray
{
    return @{@"pic_urls":[HYPhoto class]};
}

-(NSString *)created_at
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"EEE MMM d HH:mm:ss Z yyyy";
    NSDate *created_at = [fmt dateFromString:_created_at];
    if ([created_at isThisYear]) {
        if ([created_at isToday]) {
            NSDateComponents *cmp = [created_at deltaWithNow];
            if (cmp.hour >= 1) {
                return [NSString stringWithFormat:@"%ld小时之前",cmp.hour];
            }else if(cmp.minute >1){
                return [NSString stringWithFormat:@"%ld分钟之前",cmp.minute];
            }else{
                return @"刚刚";
            }
        }else if([created_at isYesterday]){
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:created_at];
        }else{
            fmt.dateFormat = @"MM-dd HH:mm";
            return [fmt stringFromDate:created_at];
        }
    }else{
        fmt.dateFormat = @"yyyy-MM-dd HH:mm";
        return [fmt stringFromDate:created_at];
    }
    return _created_at;
}
    

-(void)setSource:(NSString *)source
{
    NSRange range = [source rangeOfString:@">"];
    source = [source substringFromIndex:range.location+range.length];
    range = [source rangeOfString:@"<"];
    source = [source substringToIndex:range.location];
    source = [NSString stringWithFormat:@"来自%@",source];
    _source = source;
}

-(void)setRetweeded_status:(HYStatus *)retweeded_status
{
    _retweeded_status = retweeded_status;
    _retweetName= [NSString stringWithFormat:@"@%@",retweeded_status.user.name];
}


@end











