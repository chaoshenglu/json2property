//
//  Json2property.h
//  Json2property
//
//  Created by lixiang on 2018/2/1.
//  Copyright © 2018年 com.lixiang. All rights reserved.
//

#import <Automator/AMBundleAction.h>
#import "NSString+Extend.h"
#import <AppKit/AppKit.h>

@interface Json2property : AMBundleAction

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;

@end
