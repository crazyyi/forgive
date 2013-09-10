//
//  FGPerson.h
//  Forgive!
//
//  Created by Yi Zeng on 8/09/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FGDialog;

@interface FGPerson : NSManagedObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) FGDialog *dialog;

@end
