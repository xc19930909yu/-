//
//  ViewController.m
//  单元测试Test
//
//  Created by 李朋朋 on 2019/6/13.
//  Copyright © 2019 李朋朋. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+SGQRCode.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountInput;

@property (weak, nonatomic) IBOutlet UITextField *passInput;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (int)getPlus:(int)num1 num2:(int)num2{
    
    return  num1 + num2 ;
}

/// 异步
- (void)loadData:(void(^)(id data))dataBlock{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [NSThread sleepForTimeInterval:2];
        NSString *dataStr = @"cellCase";
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSLog(@"刷新UI");
            dataBlock(dataStr);
        });
    });
}

/// 性能
- (void)openCamera{
    for (int i = 0; i < 1000; i++) {
        
        NSLog(@"输出%d", i);
    }
}


- (IBAction)deleteClick:(id)sender {
    
    if (self.passInput.text > 0) {
        
        self.passInput.text  = [self.passInput.text substringToIndex:self.passInput.text.length - 1];
    }
}



- (IBAction)loginClick:(id)sender {
    [MBProgressHUD SG_showMBProgressHUDWithModifyStyleMessage:@"登录中..." toView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self.accountInput.text isEqualToString:@"123456"] && [self.passInput.text isEqualToString:@"1234"]) {
            [MBProgressHUD SG_hideHUDForView:self.view];
        }
    });
}

@end
