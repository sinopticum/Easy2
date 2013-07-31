//
//  Item.h
//  EasyMarket
//
//  Created by Renovatio on 7/31/13.
//  Copyright (c) 2013 Renovatio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class List;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSNumber * isChecked;
@property (nonatomic, retain) List *list;

- (Item*)initWithName: (NSString*)itemName;

@end
