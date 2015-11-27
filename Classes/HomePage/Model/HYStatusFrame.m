//
//  HYStatusFrame.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/26.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYStatusFrame.h"
#import "HYStatus.h"
#import "HYUser.h"


@implementation HYStatusFrame

-(void)setStatus:(HYStatus *)status
{
    _status = status;
    [self setUpOriginalViewFrame];
    CGFloat toolBarY = CGRectGetMaxY(_originalViewFrame);
    if (status.retweeded_status) {
        [self setUpRetweetViewFrame];
        toolBarY = CGRectGetMaxY(_retweetNameFrame);
    }
    CGFloat toolBarX = 0;
    CGFloat toolBarW = HYScreenW;
    CGFloat toolBarH = 35;
    _toolBarFrame = CGRectMake(toolBarW, toolBarY, toolBarW, toolBarH);
    _cellHeight = CGRectGetMaxY(_toolBarFrame);
    
}

-(void)setUpOriginalViewFrame
{
    //头像
    CGFloat imageX = HYStatusCellMargin;
    CGFloat imageY = imageX;
    CGFloat imageWH = 35;
    _originalIconFrame = CGRectMake(imageX, imageY, imageWH, imageWH);
    //昵称
    CGFloat nameX = CGRectGetMaxX(_originalIconFrame) + HYStatusCellMargin;
    CGFloat nameY = imageY;
    CGSize nameSize = [_status.user.name sizeWithFont:HYNameFont];
    _originalNameFrame = (CGRect){{nameX,nameY},nameSize};
    //vip图标
    if (_status.user.vip) {
        CGFloat vipX = CGRectGetMaxX(_originalNameFrame) + HYStatusCellMargin;
        CGFloat vipY = nameY;
        CGFloat vipWH = 14;
        _originalVipFrame = CGRectMake(vipX, vipY, vipWH, vipWH);
        
    }
    //时间
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(_originalNameFrame) + HYStatusCellMargin * 0.5;
    CGSize timeSize = [_status.created_at sizeWithFont:HYTimeFont];
    _originalTimeFrame = (CGRect){{timeX,timeY},timeSize};
    //来源
    CGFloat sourceX = CGRectGetMaxX(_originalTimeFrame) + HYStatusCellMargin;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [_status.source sizeWithFont:HYSourceFont];
    _originalSourceFrame = (CGRect){{sourceX,sourceY},sourceSize};
    //正文
    CGFloat textX = imageX;
    CGFloat textY = CGRectGetMaxY(_originalIconFrame) + HYStatusCellMargin;
    
    CGFloat textW = HYScreenW - 2 * HYStatusCellMargin;
    CGSize textSize = [_status.text sizeWithFont:HYTextFont constrainedToSize:CGSizeMake(textW, MAXFLOAT)];
    _originalTextFrame = (CGRect){{textX,textY},textSize};
    
    //总
    // 原创微博的frame
    CGFloat originX = 0;
    CGFloat originY = 10;
    CGFloat originW = HYScreenW;
    CGFloat originH = CGRectGetMaxY(_originalTextFrame) + HYStatusCellMargin;
    _originalViewFrame = CGRectMake(originX, originY, originW, originH);
}

- (void)setUpRetweetViewFrame
{
    // 昵称frame
    // 昵称
    CGFloat nameX = HYStatusCellMargin;
    CGFloat nameY = nameX;
    // 注意：一定要是转发微博的用户昵称
    CGSize nameSize = [_status.retweeded_status.user.name sizeWithFont:HYNameFont];
    _retweetNameFrame = (CGRect){{nameX,nameY},nameSize};
    
    // 正文
    CGFloat textX = nameX;
    CGFloat textY = CGRectGetMaxY(_retweetNameFrame) + HYStatusCellMargin;
    
    CGFloat textW = HYScreenW - 2 * HYStatusCellMargin;
    // 注意：一定要是转发微博的正文
    CGSize textSize = [_status.retweeded_status.text sizeWithFont:HYTextFont constrainedToSize:CGSizeMake(textW, MAXFLOAT)];
    _retweetTextFrame = (CGRect){{textX,textY},textSize};
    
    // 原创微博的frame
    CGFloat retweetX = 0;
    CGFloat retweetY = CGRectGetMaxY(_originalViewFrame);
    CGFloat retweetW = HYScreenW;
    CGFloat retweetH = CGRectGetMaxY(_retweetTextFrame) + HYStatusCellMargin;
    _retweetViewFrame = CGRectMake(retweetX, retweetY, retweetW, retweetH);
    
}



@end






















