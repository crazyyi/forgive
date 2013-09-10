//
//  FGDialogTests.m
//  Forgive!
//
//  Created by Yi Zeng on 28/08/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import "FGDialogTests.h"
#import "FGDialog.h"
#import "FGPerson.h"

@implementation FGDialogTests

- (void)setUp
{
    dialog = [[FGDialog alloc] init];
    
    person = [[FGPerson alloc] init];
    person.name = @"Mom";
    
    dialog.toPerson = person;
    dialog.detail = @"I want to forgive my Mom for not telling me she hid the remote control.";
    dialog.date = [NSDate distantPast];
}

- (void)tearDown
{
    dialog = nil;
    person = nil;
}

- (void)testDialogWasSpokenToSomeone
{
    STAssertEqualObjects(dialog.toPerson, person,  @"Dialog should be spoken to a person.");
}

- (void)testDialogHasABody
{
    STAssertEqualObjects(dialog.detail, @"I want to forgive my Mom for not telling me she hid the remote control.", @"Dialog should have a body.");
}

- (void)testDialogHasADate
{
    STAssertEqualObjects(dialog.date, [NSDate distantPast], @"Dialog needs to have a date.");
}

- (void)testPersonHasAName
{
    STAssertEqualObjects(person.name, @"Mom", @"Person needs to have a name.");
}
@end
