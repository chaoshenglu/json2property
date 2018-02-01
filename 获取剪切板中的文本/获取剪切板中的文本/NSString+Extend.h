//
//  NSString+Extend.h
//  ChatList
//
//  Created by James on 2/17/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extend)

+ (NSString *)stringWithDic:(NSDictionary *)dic;

+ (void)log_propertyWithResponseObject:(id)responseObject;

+ (NSString *)allProperty;

@end

@interface NSDictionary (Extend)

+ (NSDictionary *)dictionaryWithString:(NSString *)string;

@end
