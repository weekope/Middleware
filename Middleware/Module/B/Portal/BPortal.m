//
//  BPortal.m
//  Middleware
//
//  Created by 周希 on 2018/3/6.
//

#import "BPortal.h"
#import "Middleware.h"
#import "BVC.h"





@implementation BPortal

+ (void)load {
    [[Middleware shareMiddleware] registerTarget:[self class]];
}

- (void)actionB {
    BVC *b = [[BVC alloc] init];
    [b actionB];
}

- (NSString *)actionBWithReturn {
    BVC *b = [[BVC alloc] init];
    return [b actionBWithReturn];
}

@end
