//
//  Middleware.h
//  Middleware
//
//  Created by 周希 on 2018/3/5.
//

#import <Foundation/Foundation.h>





static NSString * const MiddleWareArgNoValue = @"MiddleWareArgNoValue"; //可变参数列表接受空值时，必须使用此常量替代





@protocol MiddlewareDelegate //实现该协议等价于注册，暂不需要做额外处理

@end





@interface Middleware : NSObject

/**
 创建单例对象

 @return 单例
 */
+ (instancetype)shareMiddleware;

/**
 组件间接口调用

 @param target 组件入口
 @param sel    组件接口
 @param first  参数列表第一个参数
 @return 组件接口返回值
 */
- (id)performTarget:(Class)target action:(SEL)sel params:(id)first, ...NS_REQUIRES_NIL_TERMINATION;

@end
