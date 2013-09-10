//
//  FGSecondViewController.m
//  Forgive!
//
//  Created by Yi Zeng on 16/08/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import "FGBrowseHistoryController.h"
#import "FGDialogStore.h"
#import "FGDialog.h"
#import "Logging.h"

NSString *cellName = @"forgiveCell";

@interface FGBrowseHistoryController ()

@end

@implementation FGBrowseHistoryController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"History", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    FGDialogStore *store = [FGDialogStore sharedInstance];
    
    allForgives = [store loadAll];
    
    
    if (allForgives == nil) {
        allForgives = [[NSMutableArray alloc] init];
    }
    [self.detailTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellName];
    
    self.detailTableView.delegate = self;
    self.detailTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark - UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

# pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    LogDebug(@"Total forgives: %d", allForgives.count);
    return [allForgives count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellName];
    
    FGDialog *dialog = [allForgives objectAtIndex:indexPath.row];
    LogInfo(@"%@,,,%@", dialog.subject, dialog.detail);
    NSString *displayText = [dialog.subject stringByAppendingFormat:@": %@", dialog.detail];
    
    LogInfo(@"Cell text = %@", displayText);
    tableViewCell.textLabel.text = displayText;
    
    NSTimeInterval t = dialog.timestamp;
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:t];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yy"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    
    tableViewCell.detailTextLabel.text = formattedDate;
    return tableViewCell;
}


@end
