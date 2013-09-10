//
//  FGDialog.h
//  
//
//  Created by Yi Zeng on 8/09/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface FGDialog : NSManagedObject

@property (nonatomic, strong) NSString * detail;
@property (nonatomic, strong) NSString * subject;
@property (nonatomic) NSTimeInterval timestamp;

@end
