//
//  Middleware.m
//  Middleware
//
//  Created by 周希 on 2018/3/5.
//

#import "Middleware.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>





@interface Middleware ()

/**
 用于维护各个模块向中间件注册的模块入口和接口，格式如下：
 {
    target1: [sel1, sel2, sel3],
    target2: [sel1, sel2, sel3],
    ......
 }
 */
@property (nonatomic, strong) NSMutableDictionary *dicTarget;

@end





@implementation Middleware

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static Middleware *middleware = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        middleware = [super allocWithZone:zone];
    });
    return middleware;
}

+ (instancetype)shareMiddleware {
    return [[self alloc] init];
}

- (void)registerTarget:(Class)target {
    //注册过的组件直接略过
    if ([self.dicTarget.allKeys containsObject:NSStringFromClass(target)]) {
        return;
    }
    
    //新增组件target-action
    [self.dicTarget setValue:[NSMutableArray array] forKey:NSStringFromClass(target)];
    unsigned int outCount = 0;
    Method *methods = class_copyMethodList(target, &outCount);
    for (NSInteger i=0; i<outCount; i++) {
        Method m = methods[i];
        SEL sel = method_getName(m);
        [[self.dicTarget valueForKey:NSStringFromClass(target)] addObject:NSStringFromSelector(sel)]; //暂未应用sel，暂存未来扩展
    }
    free(methods);
}

- (id)performTarget:(Class)target action:(SEL)sel params:(id)first, ... {
    //通过自身维护的注册信息，判定组件是否可被交互
    if ([self.dicTarget.allKeys containsObject:NSStringFromClass(target)]) {
        NSObject *object = [[target alloc] init];
        NSMethodSignature *signature = [object methodSignatureForSelector:sel];
        if (!signature) {
            //组件没有该服务，具体处理
            return nil;
        }
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        invocation.target = object;
        invocation.selector = sel;
        
        if (first) {
            NSInteger index = 2;
            if (first != MiddleWareArgNoValue) {
                [invocation setArgument:&first atIndex:index];
            }
            
            va_list args;
            va_start(args, first);
            id arg;
            while ((arg = va_arg(args, id))) {
                index++;
                if (arg != MiddleWareArgNoValue) {
                    [invocation setArgument:&arg atIndex:index];
                }
            }
            va_end(args);
        }
        
        [invocation invoke];
        
        return [self getReturnValue:invocation];
    }
    else { //未注册组件不予理会，具体处理
        return nil;
    }
}

- (id)getReturnValue:(NSInvocation *)invocation {
    const char* retType = invocation.methodSignature.methodReturnType;
    
    if (strcmp(retType, @encode(void)) == 0) {
        return nil;
    }
    if (strcmp(retType, @encode(NSInteger)) == 0) {
        NSInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    if (strcmp(retType, @encode(BOOL)) == 0) {
        BOOL result = NO;
        [invocation getReturnValue:&result];
        return @(result);
    }
    if (strcmp(retType, @encode(CGFloat)) == 0) {
        CGFloat result = 0.0f;
        [invocation getReturnValue:&result];
        return @(result);
    }
    if (strcmp(retType, "@") == 0) {
        NSObject *result = [[NSObject alloc] init];
        [invocation getReturnValue:&result];
        return result;
    }
    
    return nil;
}

- (NSMutableDictionary *)dicTarget {
    if (!_dicTarget) {
        _dicTarget = [NSMutableDictionary dictionary];
    }
    return _dicTarget;
}

@end
