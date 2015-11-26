//
//  HYAccount.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/23.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYAccount.h"

#define HYAccountTokenKey @"token"
#define HYUidKey @"uid"
#define HYExpires_inKey @"exoires"
#define HYExpires_dateKey @"date"

@implementation HYAccount

+(instancetype)accountWithDict:(NSDictionary *)dict
{
    HYAccount *account = [[self alloc] init];
    [account setValuesForKeysWithDictionary:dict];
    return account;
}

-(void)setExpires_in:(NSString *)expires_in
{
    _expires_in = expires_in;
    _expires_date = [NSDate dateWithTimeIntervalSinceNow:[expires_in longLongValue]];
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_access_token forKey:HYAccountTokenKey];
    [aCoder encodeObject:_expires_in forKey:HYExpires_inKey];
    [aCoder encodeObject:_uid forKey:HYUidKey];
    [aCoder encodeObject:_expires_date forKey:HYExpires_dateKey];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _access_token = [aDecoder decodeObjectForKey:HYAccountTokenKey];
        _expires_in = [aDecoder decodeObjectForKey:HYExpires_inKey];
        _uid = [aDecoder decodeObjectForKey:HYUidKey];
        _expires_date = [aDecoder decodeObjectForKey:HYExpires_dateKey];
    }
    return self;
}


@end





