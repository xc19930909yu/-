//
//  ViewControllerTest.m
//  单元测试TestTests
//
//  Created by 李朋朋 on 2019/6/13.
//  Copyright © 2019 李朋朋. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface ViewControllerTest : XCTestCase

@property(nonatomic, strong)ViewController *vc;
@end

@implementation ViewControllerTest

- (void)setUp {
    
    self.vc = [[ViewController alloc]  init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    
    self.vc = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}


// 逻辑测试
- (void)testPlus {
    // 1.given
    int num1 = 10;
    int num2 = 20;
    
    // 2.when
    int result = [self.vc getPlus:num1 num2:num2];
    
    // 3.then
    XCTAssertEqual(result, 30, @"错误");
}


// 异步测试
- (void)testAsyn{
    /// 测试指标  1.请求到的数据 2.请求时间
    XCTestExpectation *exceptions =  [self expectationWithDescription:@"等待时间太长"];
    [self.vc loadData:^(id data) {
      XCTAssertNotNil(data, @"请求数据报错");
        //如果断言没问题，就调用fulfill宣布测试满足
      [exceptions fulfill];
    }];
     // 设置等待时间 1.5 超过性能不佳
    [self waitForExpectationsWithTimeout:2.3 handler:^(NSError * _Nullable error) {
        NSLog(@"%@", error);
    }];
    
    
}


// 性能测试 指标设置baseline 和平均时间
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        
        [self.vc openCamera];
        // Put the code you want to measure the time of here.
    }];
}

@end
