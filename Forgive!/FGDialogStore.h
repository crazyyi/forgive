//
//  FGDialogStore.h
//  Forgive!
//
//  Created by Yi Zeng on 9/09/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FGDialog;

@interface FGDialogStore : NSObject
{
    NSMutableArray *allPeople;
    NSManagedObjectContext *ctx;
    NSManagedObjectModel *model;
}

@property (nonatomic, strong) NSMutableArray *allDialogs;

+ (FGDialogStore *)sharedInstance;
- (FGDialog *)createDialogWithName:(NSString *)name andDetaiText:(NSString *)text;
- (NSMutableArray *)loadAll;
@end
