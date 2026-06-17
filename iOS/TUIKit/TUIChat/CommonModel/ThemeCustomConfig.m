//
//  ThemeCustomConfig.m
//  TUIChat
//
//  Created by WeasonLi on 2026/6/8.
//

#import "ThemeCustomConfig.h"

@implementation ThemeCustomConfig

+ (instancetype)sharedConfig {
    static ThemeCustomConfig *config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[ThemeCustomConfig alloc] init];
    });
    return config;
}

@end
