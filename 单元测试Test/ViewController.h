//
//  ViewController.h
//  单元测试Test
//
//  Created by 李朋朋 on 2019/6/13.
//  Copyright © 2019 李朋朋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (int)getPlus:(int)num1 num2:(int)num2;


- (void)loadData:(void(^)(id data))dataBlock;


- (void)openCamera;

@end

