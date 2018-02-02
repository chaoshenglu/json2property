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
    //获取鼠标选中的字符串
    NSArray *arr = (NSArray *)input;
    NSString *string = [NSString stringWithFormat:@"%@",arr.firstObject];
    
    //字符串转字典
    NSDictionary *dic = [NSDictionary dictionaryWithString:string];
    
    //字典中遍历出相关字段，生成property
    [NSString findPropertyWithDic:dic];
    
    //合并生成最终需要的字符串
    NSString *result = [NSString allProperty];
    
    //拷贝到剪贴板
    [[NSPasteboard generalPasteboard] declareTypes:[NSArray arrayWithObject:NSStringPboardType] owner:nil];
    [[NSPasteboard generalPasteboard] setString:result forType:NSStringPboardType];
    
    return result;
}

@end
