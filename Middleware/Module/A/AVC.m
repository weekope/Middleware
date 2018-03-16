//
//  AVC.m
//  Middleware
//
//  Created by 周希 on 2018/3/5.
//

#import "AVC.h"
#import "Middleware.h"





@interface AVC ()

@end





@implementation AVC

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
    [[Middleware shareMiddleware] performTarget:NSClassFromString(@"BPortal") action:NSSelectorFromString(@"actionB") params:nil];
}

- (IBAction)actionButton1:(UIButton *)sender {
    NSString *string = [[Middleware shareMiddleware] performTarget:NSClassFromString(@"BPortal") action:NSSelectorFromString(@"actionBWithReturn") params:nil];
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"这是组件B参数"
                                                                message:string
                                                         preferredStyle:UIAlertControllerStyleAlert];
    [ac addAction:[UIAlertAction actionWithTitle:@"666" style:UIAlertActionStyleDefault handler:nil]];
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:ac animated:YES completion:nil];
}


#pragma mark - service

- (void)actionAWithText:(NSString *)text confirmBlock:(void (^)(NSString *))block {
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:nil
                                                                message:text
                                                         preferredStyle:UIAlertControllerStyleAlert];
    [ac addAction:[UIAlertAction actionWithTitle:@"666"
                                           style:UIAlertActionStyleDefault
                                         handler:^(UIAlertAction * _Nonnull action) {
                                             if (block) {
                                                 block(action.title);
                                             }
    }]];
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:ac animated:YES completion:nil];
}

@end
