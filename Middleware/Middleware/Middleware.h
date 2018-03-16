//
//  Middleware.h
//  Middleware
//
//  Created by 周希 on 2018/3/5.
//

#import <Foundation/Foundation.h>





@interface Middleware : NSObject

/**
 创建单例对象

 @return 单例
 */
+ (instancetype)shareMiddleware;

/**
 注册模块入口，用来获取模块提供的接口

 @param target 模块入口
 */
- (void)registerTarget:(Class)target;

/**
 组件间接口调用

 @param target 组件入口
 @param sel    组件接口
 @param params 接口参数（参数校验，形式不友好）
 @return 组件接口返回值
 */
- (id)performTarget:(Class)target action:(SEL)sel params:(NSArray *)params;

@end
