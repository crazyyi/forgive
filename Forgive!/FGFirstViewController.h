//
//  FGFirstViewController.h
//  Forgive!
//
//  Created by Yi Zeng on 16/08/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface FGFirstViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@end
