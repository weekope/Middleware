//
//  BVC.h
//  Middleware
//
//  Created by 周希 on 2018/3/5.
//

#import <UIKit/UIKit.h>





@interface BVC : UIViewController

- (void)actionBWithParam1:(NSString *)string1 param2:(NSString *)string2 param3:(id)object param4:(void (^)(NSString *string))block;

@end
