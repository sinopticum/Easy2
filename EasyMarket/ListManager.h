//
//  ListManager.h
//  EasyMarket
//
//  Created by Renovatio on 7/31/13.
//  Copyright (c) 2013 Renovatio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class List;

@interface ListManager : NSManagedObject

@property (nonatomic, retain) NSSet *lists;
@property (nonatomic, retain) NSManagedObjectContext* managedObjectContext;

@end

@interface ListManager (CoreDataGeneratedAccessors)

- (BOOL)addList:(List *)newList;
- (BOOL)removeList:(List *)removableList;
- (BOOL)renameList:(List *)tmpList WithName:(NSString *)newListName;
- (NSArray *)lists;

@end
