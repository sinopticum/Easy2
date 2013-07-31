//
//  List.h
//  EasyMarket
//
//  Created by Renovatio on 7/31/13.
//  Copyright (c) 2013 Renovatio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item, ListManager;

@interface List : NSManagedObject

@property (nonatomic, retain) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, retain) NSString * listName;
@property (nonatomic, retain) NSNumber * listProgress;
@property (nonatomic, retain) NSSet *listItems;
@property (nonatomic, retain) ListManager *listManager;

- (List*)initWithName: (NSString*)listName;

@end

@interface List (CoreDataGeneratedAccessors)

- (BOOL)addListItem:(Item *)value;
- (BOOL)removeListItem:(Item *)value;
- (BOOL)renameListItem:(Item *)tmpItem WithName:(NSString*)newItemName;
- (NSArray*)listItems;

@end
