//___FILEHEADER___

#import <XCTest/XCTest.h>

@interface ___FILEBASENAMEASIDENTIFIER___ : XCTestCase

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}


- (void)testLogin {
    XCUIApplication *app = [[XCUIApplication alloc]  init];
    
    XCUIElementQuery *textFildQuery = [app.otherElements childrenMatchingType:XCUIElementTypeTextField];
    
    XCUIElementQuery *btnQuery = [app.otherElements childrenMatchingType:XCUIElementTypeButton];
    
    XCUIElement *account =  [textFildQuery elementBoundByIndex:0];
    
    XCUIElement *pass = [textFildQuery elementBoundByIndex:1];
    
    XCUIElement *btn = [btnQuery elementBoundByIndex:1];
    
    XCUIElement *deleteBtn = [btnQuery elementBoundByIndex:0];
    
    [account tap];
    [account typeText:@"123456"];
    [pass tap];
    [pass typeText:@"123456"];
    [deleteBtn tap];
    [deleteBtn tap];
    [btn tap];
}

@end
