//
//  FGSecondViewController.h
//  Forgive!
//
//  Created by Yi Zeng on 16/08/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

extern NSString *cellName;


@interface FGBrowseHistoryController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *allForgives;
}

@property (weak, nonatomic) IBOutlet UITableView *detailTableView;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@end
