//
//  FGFirstViewController.m
//  Forgive!
//
//  Created by Yi Zeng on 16/08/13.
//  Copyright (c) 2013 AFun. All rights reserved.
//

#import "FGFirstViewController.h"
#import "UIColor+Colours.h"
#import "FGPerson.h"
#import "FGDialog.h"
#import "FGDialogStore.h"
#import "Logging.h"

@interface FGFirstViewController ()

@end

@implementation FGFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
     withUserDefaults:(NSUserDefaults *)userDefaults
{
    defaults = userDefaults;
    return [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Type", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView *superView = self.view;
    superView.backgroundColor = [UIColor emeraldColor];

    defaults = [[NSUserDefaults alloc] init];
    
    self.nameTextField.backgroundColor = [UIColor whiteColor];
    self.detailTextField.backgroundColor = [UIColor whiteColor];
    
    self.nameTextField.delegate = self;
    self.detailTextField.delegate = self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)nextButtonPressed:(id)sender {
    
    [defaults setObject:self.nameTextField.text forKey:@"person"];
    LogInfo(@"Added value: %@", [defaults valueForKey:@"person"]);
    
    [self saveTexts];
    
}

- (void)saveTexts
{
    FGDialogStore *dialogStore = [FGDialogStore sharedInstance];
    
    [dialogStore createDialogWithName:self.nameTextField.text andDetaiText:self.detailTextField.text];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.detailTextField) {
        NSUInteger newLength = [textField.text length] + string.length - range.length;
        return newLength <= 25;
    }
    
    return YES;
}
@end
