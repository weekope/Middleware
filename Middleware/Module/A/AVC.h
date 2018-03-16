//
//  AVC.h
//  Middleware
//
//  Created by 周希 on 2018/3/5.
//

#import <UIKit/UIKit.h>





@interface AVC : UIViewController

- (void)actionAWithText:(NSString *)text confirmBlock:(void(^)(NSString *confirm))block;

@end
