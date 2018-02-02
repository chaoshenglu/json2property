//
//  Json2property.m
//  Json2property
//
//  Created by lixiang on 2018/2/1.
//  Copyright © 2018年 com.lixiang. All rights reserved.
//

#import "Json2property.h"

@implementation Json2property

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo {
    NSArray *arr = (NSArray *)input;
    NSString *string = arr.lastObject;
    NSDictionary *dic = [NSDictionary dictionaryWithString:string];
    [NSString findPropertyWithDic:dic];
    return [NSString allProperty];
}

@end
