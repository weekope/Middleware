//
//  BVC.m
//  Middleware
//
//  Created by 周希 on 2018/3/5.
//

#import "BVC.h"
#import "Middleware.h"





@interface BVC ()

@end





@implementation BVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - action

- (IBAction)actionButton:(UIButton *)sender {
    [[Middleware shareMiddleware] performTarget:NSClassFromString(@"APortal") action:NSSelectorFromString(@"actionAWithText:confirmBlock:") params:@[@"B调用A"]];
}


#pragma mark - service

- (void)actionB {
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:nil
                                                                message:@"模块B被调用"
                                                         preferredStyle:UIAlertControllerStyleAlert];
    [ac addAction:[UIAlertAction actionWithTitle:@"666" style:UIAlertActionStyleDefault handler:nil]];
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:ac animated:YES completion:nil];
}

- (NSString *)actionBWithReturn {
    return @"这是组件B";
}

@end
