//
//  APortal.m
//  Middleware
//
//  Created by 周希 on 2018/3/6.
//

#import "APortal.h"
#import "Middleware.h"
#import "AVC.h"





@implementation APortal

//考虑动态注册方案，即不需要在启动时间注册，需要在第一次组件启用时注册
+ (void)load {
    //方案一：此处直接注册portal作为target，对action进行封装
    [[Middleware shareMiddleware] registerTarget:[self class]];
    
    //方案二：直接注册模块target-action
    //必须自己实现registerTarget方法，但不需要对action进行封装
    //已弃用：组件服务最好采取集约管理方式（portal统一管理），而不要分散到各个文件中
}

- (void)actionAWithText:(NSString *)text confirmBlock:(void (^)(NSString *confirm))block {
    AVC *a = [[AVC alloc] init];
    [a actionAWithText:text confirmBlock:block];
}

@end
