//
//  FGFirstViewControllerTests.m
//  Forgive!
//
//  Created by Yi Zeng on 29/08/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import "FGFirstViewControllerTests.h"
#import "FGFirstViewController.h"
#import <objc/runtime.h>
#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

#define MOCKITO_SHORTHAND
#import <OCMockitoIOS/OCMockitoIOS.h>

@implementation FGFirstViewControllerTests
{
    NSUserDefaults *mockUserDefaults;
}

- (void)setUp
{
    mockUserDefaults = mock([NSUserDefaults class]);
    
    controller = [[FGFirstViewController alloc] initWithNibName:@"somenib" bundle:nil withUserDefaults:mockUserDefaults];
    
}

- (void)tearDown
{
    controller = nil;
}

- (void)testViewControllerHasATextFieldProperty
{
    objc_property_t textFieldProperty = class_getProperty([controller class], "textField");
    STAssertTrue(textFieldProperty != NULL, @"FGFirstViewController needs a textfield.");
}

- (void)testViewControllerHasAButtonProperty
{
    objc_property_t buttonProperty = class_getProperty([controller class], "nextButton");
    STAssertTrue(buttonProperty != NULL, @"FGFirstViewController needs a next button.");
}

- (void)testWhenReturnKeyWasPressedKeyboardDismissed
{
    
}

- (void)testWhenTouchesAnywhereKeyboardDismissed
{
    
}



@end
