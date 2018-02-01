//
//  NSString+Extend.m
//  ChatList
//
//  Created by James on 2/17/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "NSString+Extend.h"

NSMutableString *propertyStr;

@implementation NSString (Extend)

+ (void)log_propertyWithResponseObject:(id)responseObject {
    propertyStr = [NSMutableString new];
    NSDictionary *dic_responseObject = [responseObject isKindOfClass:[NSDictionary class]]?responseObject:@{};
    id data = dic_responseObject[@"data"];
    if ([data isKindOfClass:[NSDictionary class]]) {
        [NSString log_propertyWithDict:data name:@"data"];
        [self findAllKeysInsideDict:data];
    }else if ([data isKindOfClass:[NSArray class]]) {
        NSArray *dataArr = data;
        id first = dataArr.firstObject;
        if ([first isKindOfClass:[NSDictionary class]]) {
            [NSString log_propertyWithDict:first name:@"data"];
            [self findAllKeysInsideDict:first];
        }
    }else{
        [NSString log_propertyWithDict:dic_responseObject name:@"root"];
        [NSString findAllKeysInsideDict:dic_responseObject];
    }
}

+ (void)findAllKeysInsideDict:(NSDictionary *)dic {
    for (NSString *key in dic.allKeys) {
        id value = dic[key];
        if ([value isKindOfClass:[NSDictionary class]]) {
            [NSString log_propertyWithDict:value name:key];
            [self findAllKeysInsideDict:value];
        }else if([value isKindOfClass:[NSArray class]]){
            NSArray *arr = value;
            id first = arr.firstObject;
            if ([first isKindOfClass:[NSDictionary class]]) {
                [NSString log_propertyWithDict:first name:key];
                [self findAllKeysInsideDict:first];
            }
        }
    }
}

+ (void)log_propertyWithDict:(NSDictionary *)dic name:(NSString *)name {
    for (NSString *key in dic.allKeys) {
        id value = dic[key];
        if ([value isKindOfClass:[NSString class]]) {
            
            if ([key hasSuffix:@"id"]) {
                NSString *str = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;",key];
                //如果是NSString，且以id结尾，设为strong_NSString
                [propertyStr appendString:str];
                [propertyStr appendString:@"\n"];
            }else if ([key hasSuffix:@"Id"]){
                NSString *str = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;",key];
                //如果是NSString，且以Id结尾，设为strong_NSString
                [propertyStr appendString:str];
                [propertyStr appendString:@"\n"];
            }else if ([key hasSuffix:@"price"]){
                NSString *str = [NSString stringWithFormat:@"@property (nonatomic, assign) float %@;",key];
                //如果是NSString，且以price结尾，设为float
                [propertyStr appendString:str];
                [propertyStr appendString:@"\n"];
            }else if ([key hasSuffix:@"Price"]){
                NSString *str = [NSString stringWithFormat:@"@property (nonatomic, assign) float %@;",key];
                //如果是NSString，且以Price结尾，设为float
                [propertyStr appendString:str];
                [propertyStr appendString:@"\n"];
            }else if ([value containsString:@"."]){
                NSString *str = [NSString stringWithFormat:@"@property (nonatomic, assign) float %@;",key];
                //如果是NSString，且包含小数点，设为float
                [propertyStr appendString:str];
                [propertyStr appendString:@"\n"];
            }else{
                NSString *str = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",key];
                //默认为NSString
                [propertyStr appendString:str];
                [propertyStr appendString:@"\n"];
            }
            
        }else if ([value isKindOfClass:[NSNumber class]]){
            
            NSNumber *number = value;
            NSString *numberStr = [NSString stringWithFormat:@"%@",number];
            if ([key hasSuffix:@"id"]) {
                NSString *str = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;",key];
                //如果是Number，且以id结尾，设为strong_NSString
                [propertyStr appendString:str];
                [propertyStr appendString:@"\n"];
            }else if ([key hasSuffix:@"Id"]){
                NSString *str = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;",key];
                //如果是Number，且以Id结尾，设为strong_NSString
                [propertyStr appendString:str];
                [propertyStr appendString:@"\n"];
            }else if ([key hasSuffix:@"price"]){
                NSString *str = [NSString stringWithFormat:@"@property (nonatomic, assign) float %@;",key];
                //如果是Number，且以price结尾，设为float
                [propertyStr appendString:str];
                [propertyStr appendString:@"\n"];
            }else if ([key hasSuffix:@"Price"]){
                NSString *str = [NSString stringWithFormat:@"@property (nonatomic, assign) float %@;",key];
                //如果是Number，且以Price结尾，设为float
                [propertyStr appendString:str];
                [propertyStr appendString:@"\n"];
            }else if ([numberStr containsString:@"."]){
                NSString *str = [NSString stringWithFormat:@"@property (nonatomic, assign) float %@;",key];
                //如果是Number，且包含小数点，设为float
                [propertyStr appendString:str];
                [propertyStr appendString:@"\n"];
            }else {
                NSString *str = [NSString stringWithFormat:@"@property (nonatomic, assign) int %@;",key];
                // 其他Number，默认为int
                [propertyStr appendString:str];
                [propertyStr appendString:@"\n"];
            }
            
        }else if ([value isKindOfClass:[NSArray class]]){
            //如果是Array，默认为NSArray
        }else if ([value isKindOfClass:[NSDictionary class]]){
            //如果是Dictionary，默认为自定义模型对象
        }else if ([value isKindOfClass:[NSNull class]]){
            NSString *str = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",key];
            //如果是Null，暂且设为NSString，提示为Null
            [propertyStr appendString:str];
            [propertyStr appendString:@"\n"];
        }
    }
}

+ (NSString *)stringWithDict:(NSDictionary *)dict {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (jsonData) {
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}

+ (NSString *)allProperty {
    return [propertyStr substringToIndex:propertyStr.length-1];
}

+ (NSString *)stringWithDic:(NSDictionary *)dic {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end

@implementation NSDictionary (Extend)

+ (NSDictionary *)dictionaryWithString:(NSString *)string {
    if(string == nil){
        return @{};
    }
    NSData *jsonData = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        return @{};
    }
    return dic;
}

@end



