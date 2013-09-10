//
//  FGAppDelegateTests.h
//  Forgive!
//
//  Created by Yi Zeng on 29/08/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class FGAppDelegate;

@interface FGAppDelegateTests : SenTestCase
{
    UIWindow *window;
    FGAppDelegate *appDelegate;
    BOOL appDidFinishLaunchingReturn;
}
@end
