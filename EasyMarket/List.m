//
//  List.m
//  EasyMarket
//
//  Created by Renovatio on 7/31/13.
//  Copyright (c) 2013 Renovatio. All rights reserved.
//

#import "List.h"
#import "Item.h"
#import "ListManager.h"
#import "RSAppDelegate.h"

@implementation List

@dynamic listName;
@dynamic listProgress;
@dynamic listItems;
@dynamic listManager;

@synthesize managedObjectContext;

- (id)init
{
    self = [super init];
    
    RSAppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    return self;
}

- (List*)initWithName:(NSString *)listName
{
    self = [super init];
    
    self.listName = listName;
    
    return self;
}

- (NSArray*)listItems
{
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"Item" inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc]init];
    
    [fetchRequest setEntity:entity];
    
    NSError* error = nil;
    
    return [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
}
@end
