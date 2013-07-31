//
//  Item.m
//  EasyMarket
//
//  Created by Renovatio on 7/31/13.
//  Copyright (c) 2013 Renovatio. All rights reserved.
//

#import "Item.h"
#import "List.h"


@implementation Item

@dynamic itemName;
@dynamic isChecked;
@dynamic list;

- (Item*)initWithName:(NSString *)itemName
{
    self = [super init];
    
    self.itemName = itemName;
    
    return self;
}

@end
