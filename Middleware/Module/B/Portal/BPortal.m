//
//  BPortal.m
//  Middleware
//
//  Created by 周希 on 2018/3/6.
//

#import "BPortal.h"
#import "BVC.h"





@implementation BPortal

- (void)actionBWithParam1:(NSString *)string1 param2:(NSString *)string2 param3:(id)object param4:(void (^)(NSString *string))block {
    BVC *b = [[BVC alloc] init];
    [b actionBWithParam1:string1 param2:string2 param3:object param4:block];
}

@end
