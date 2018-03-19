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


#pragma mark - service

- (void)actionBWithParam1:(NSString *)string1 param2:(NSString *)string2 param3:(id)object param4:(void (^)(NSString *))block {
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:string1
                                                                message:string2
                                                         preferredStyle:UIAlertControllerStyleAlert];
    [ac addAction:[UIAlertAction actionWithTitle:@"666" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        block(action.title);
    }]];
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:ac animated:YES completion:nil];
}

@end
