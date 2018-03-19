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
    void (^block)(NSString *string) = ^(NSString *string){
        NSLog(@"%@", string);
    };
    [[Middleware shareMiddleware] performTarget:NSClassFromString(@"BPortal")
                                         action:NSSelectorFromString(@"actionBWithParam1:param2:param3:param4:")
                                         params:@"string1", MiddleWareArgNoValue, [NSObject new], block, nil];
}

@end
