//
//  testAction.m
//  testAction
//
//  Created by lixiang on 2018/2/1.
//  Copyright © 2018年 com.lixiang. All rights reserved.
//

#import <Automator/AMBundleAction.h>

@interface test : AMBundleAction

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;

@end


/*
 
 配合AppleScript代码：
 
 on run {input, parameters}
 set the clipboard to (input as string)
 end run
 
 */
