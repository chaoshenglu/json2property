//
//  testAction.m
//  testAction
//
//  Created by lixiang on 2018/2/1.
//  Copyright © 2018年 com.lixiang. All rights reserved.
//

#import "test.h"
#import <AppKit/AppKit.h>
#import "NSString+Extend.h"

@implementation test

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo {
    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    NSString *string = [pb stringForType:NSPasteboardTypeString];
    
    return string;
}

@end
