//
//  HYUploadParam.h
//  HYWeiBo
//
//  Created by yehowell on 15/11/30.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYUploadParam : NSObject

@property(nonatomic, strong)NSData *data;

@property(nonatomic, copy)NSString *name;

@property(nonatomic, copy)NSString *fileName;

@property(nonatomic, copy)NSString *mimeType;

@end
