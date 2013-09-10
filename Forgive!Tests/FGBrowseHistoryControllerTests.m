//
//  FGBrowseHistoryControllerTests.m
//  Forgive!
//
//  Created by Yi Zeng on 29/08/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import "FGBrowseHistoryControllerTests.h"
#import "FGBrowseHistoryController.h"
#import <objc/runtime.h>

@implementation FGBrowseHistoryControllerTests

- (void)setUp
{
    controller = [[FGBrowseHistoryController alloc] init];
}

- (void)tearDown
{
    controller = nil;
}

- (void)testViewControllerHasATableViewProperty
{
    objc_property_t tableViewProperty = class_getProperty([controller class], "detailTableView");
    STAssertTrue(tableViewProperty != NULL, @"FGBrowseHistoryController should have a table view property.");
}
@end
