//
//  ListManager.m
//  EasyMarket
//
//  Created by Renovatio on 7/31/13.
//  Copyright (c) 2013 Renovatio. All rights reserved.
//

#import "ListManager.h"
#import "List.h"
#import "RSAppDelegate.h"

@implementation ListManager

@synthesize managedObjectContext;

@dynamic lists;

- (id)init
{
    self = [super init];
    
    RSAppDelegate* appDelegate = [[UIApplication sharedApplication]delegate];
    
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    return self;
}

- (NSArray*)lists
{
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"List" inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc]init];
    
    [fetchRequest setEntity:entity];
    
    NSError* error = nil;
    
    return [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
}

- (NSManagedObjectID*)listIDByListName:(NSString*)listName
{
    NSManagedObjectID* listID = nil;
    
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"List" inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc]init];
    
    [fetchRequest setEntity:entity];
    
    NSError* error = nil;
    
    NSArray* lists = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (lists!=nil && lists.count>0)
    {
        for (List* list in lists)
        {
            if ([list.listName isEqualToString: listName])
                listID = list.objectID;
        }
    }
    
    return listID;
}

- (BOOL)addList:(List *)newList
{
    NSError* error = nil;
    
    [self.managedObjectContext insertObject:(NSManagedObject*)newList];
    
    return [self.managedObjectContext save:&error];
}

- (BOOL)removeList:(List *)removableList
{
    NSError* error = nil;
    
    [self.managedObjectContext deleteObject:removableList];
    
    return [self.managedObjectContext save:&error];
}

- (BOOL)renameList:(List *)tmpList WithName:(NSString *)newListName
{
    tmpList.listName = newListName;
    
    NSError* error = nil;
    
    return [self.managedObjectContext save:&error];
}

@end
