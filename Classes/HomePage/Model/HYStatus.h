//
//  HYStatus.h
//  HYWeiBo
//
//  Created by yehowell on 15/11/24.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MJExtension.h"
#import "HYUser.h"

@interface HYStatus : NSObject<MJKeyValue>

@property(nonatomic, strong)HYStatus *retweeded_status;

@property(nonatomic, strong)HYUser *user;

@property(nonatomic, copy)NSString *retweetName;


/**
 *  微博创建时间
 */
@property (nonatomic, copy) NSString *created_at;

/**
 *  字符串型的微博ID
 */
@property (nonatomic, copy) NSString *idstr;

/**
 *  微博信息内容
 */
@property (nonatomic, copy) NSString *text;

/**
 *  微博来源
 */
@property (nonatomic, copy) NSString *source;

/**
 *  转发数
 */
@property (nonatomic, assign) int reposts_count;

/**
 *  评论数
 */
@property (nonatomic, assign) int comments_count;

/**
 *  表态数(赞)
 */
@property (nonatomic, assign) int attitudes_count;

/**
 *  配图数组(CZPhoto)
 */
@property (nonatomic, strong) NSArray *pic_urls;

@end
