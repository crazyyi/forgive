//
//  FGDialogStore.m
//  Forgive!
//
//  Created by Yi Zeng on 9/09/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import "FGDialogStore.h"
#import "FGDialog.h"
#import "Logging.h"
#import <CoreData/CoreData.h>

@implementation FGDialogStore

NSString *const kDataSQLiteName = @"Forgive.sqlite";
NSString *const kDataManagerModelName = @"Forgive!";

+ (FGDialogStore *)sharedInstance
{
    static dispatch_once_t onceToken;
    static FGDialogStore *sharedInstance = nil;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        model = [self managedObjectModel];
        
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        
        NSString *path = [self archivePath];
        
        NSURL *storeURL = [NSURL fileURLWithPath:path];
        
        NSError *error = nil;
        
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
            [NSException raise:@"open failed" format:@"Reason: %@", [error localizedDescription]];
        }
        
        ctx = [[NSManagedObjectContext alloc] init];
        
        [ctx setPersistentStoreCoordinator:psc];
        
        [ctx setUndoManager:nil];
        
        [self loadAll];
    }
    
    return self;
    
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (model != nil) {
        return model;
    }
    
    NSBundle *bundle = [NSBundle mainBundle];
    
    NSString *modelPath = [bundle pathForResource:kDataManagerModelName ofType:@"mom"];
    
    LogInfo(@"Model path = %@", modelPath);
    
    NSURL *url = [NSURL fileURLWithPath:modelPath];
    
    model = [[NSManagedObjectModel alloc] initWithContentsOfURL:url];
    
    return model;
}

- (NSString *)archivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:kDataSQLiteName];
}

// Update data
- (BOOL)saveChanges
{
    NSError *err = nil;
    
    BOOL successful = [ctx save:&err];
    
    if (!successful) {
        LogError(@"Error saving: %@", [err localizedDescription]);
    }
    
    return successful;
}

// Fetch all

- (NSMutableArray *)loadAll
{
    if (!_allDialogs) {
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *e = [[model entitiesByName] objectForKey:@"FGDialog"];
        
        [request setEntity:e];
        
        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"timestamp" ascending:YES];
        
        [request setSortDescriptors:[NSArray arrayWithObject:sd]];
        
        NSError *error;
        
        NSArray *result = [ctx executeFetchRequest:request error:&error];
        
        if (!result) {
            [NSException raise:@"Fetch failed" format:@"Reason: %@", [error localizedDescription]];
        }
        
        _allDialogs = [[NSMutableArray alloc] initWithArray:result];
        
    }
    
    return _allDialogs;
}

//Save

- (FGDialog *)createDialogWithName:(NSString *)name andDetaiText:(NSString *)text
{
    NSTimeInterval t = [[NSDate date] timeIntervalSinceReferenceDate];
    
    FGDialog *dialog = [NSEntityDescription insertNewObjectForEntityForName:@"FGDialog" inManagedObjectContext:ctx];
    
    [dialog setTimestamp:t];
    [dialog setSubject:name];
    [dialog setDetail:text];
    [_allDialogs addObject:dialog];
    
    [self saveChanges];
    
    return dialog;
}
@end
