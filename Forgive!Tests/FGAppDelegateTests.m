//
//  FGAppDelegateTests.m
//  Forgive!
//
//  Created by Yi Zeng on 29/08/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import "FGAppDelegateTests.h"
#import "FGAppDelegate.h"
#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

#define MOCKITO_SHORTHAND
#import <OCMockitoIOS/OCMockitoIOS.h>

@implementation FGAppDelegateTests

- (void)setUp
{
    window = [[UIWindow alloc] init];
    appDelegate = [[FGAppDelegate alloc] init];
    appDelegate.window = window;
    appDidFinishLaunchingReturn = [appDelegate application: nil didFinishLaunchingWithOptions:nil];
}

- (void)tearDown
{
    window = nil;
    appDelegate = nil;
}

- (void)testWindowIsKeyAfterApplicationLaunch
{
    //when
    
    //given

    //then
//    assertThatBool(window.keyWindow, is(equalToBool(YES)));
}

- (void)testAppDidFinishLaunchingReturnYES
{
    assertThatBool(appDidFinishLaunchingReturn, is(equalToBool(YES)));

}

@end
