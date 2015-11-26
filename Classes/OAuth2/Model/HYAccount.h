//
//  HYAccount.h
//  HYWeiBo
//
//  Created by yehowell on 15/11/23.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYAccount : NSObject<NSCoding>

@property(nonatomic, copy)NSString *access_token;

@property(nonatomic, copy)NSString *expires_in;

@property(nonatomic, copy)NSString *uid;

@property(nonatomic, strong)NSDate *expires_date;

@property(nonatomic, copy)NSString *remind_in;

@property (nonatomic, copy) NSString *name;

+(instancetype)accountWithDict:(NSDictionary *)dict;

@end
