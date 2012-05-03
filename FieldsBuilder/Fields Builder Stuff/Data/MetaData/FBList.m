//
//  FBList.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FBList.h"
#import "FBListItem.h"


@interface FBList ()

@property (nonatomic, retain) NSMutableArray *list;

@end;


@implementation FBList

@synthesize list;
@synthesize listID;
@dynamic count;

- (NSInteger)count
{
    return [self.list count];
}

- (id)initWithListID:(NSString *)aListID
{
    self = [super init];
    if (nil != self) 
    {
        list = [[NSMutableArray	 alloc] init];
        listID = [aListID copy];
    }
    
    return self;
}

- (void)dealloc
{
    [list release];
    [listID release];
    
    [super dealloc];
}

- (void)setItemLabel:(NSString *)aLabel forItemKey:(NSString *)aKey
{
    FBListItem *listItem = [[[FBListItem alloc] initWithLabel:aLabel forKey:aKey] autorelease];
    [self.list addObject:listItem];
}

- (NSString *)itemLabelForKey:(NSString *)aKey
{
    for (FBListItem *listItem in self.list)
    {
        if ([listItem.key isEqualToString:aKey]) 
        {
            return listItem.label;
        }
    }
    
    return nil;
}

- (NSString *)itemKeyForLabel:(NSString *)aLabel
{
    for (FBListItem *listItem in self.list)
    {
        if ([listItem.label isEqualToString:aLabel]) 
        {
            return listItem.key;
        }
    }
    
    return nil;
}

- (NSString *)itemLabelForIndex:(NSInteger)anIndex
{
    if (anIndex >= 0 && anIndex < [self.list count]) 
    {
        FBListItem *listItem = [self.list objectAtIndex:anIndex];
        return listItem.label;
    }
    
    return nil;
}

- (NSString *)itemKeyForIndex:(NSInteger)anIndex
{
    if (anIndex >= 0 && anIndex < [self.list count]) 
    {
        FBListItem *listItem = [self.list objectAtIndex:anIndex];
        return listItem.key;
    }
    
    return nil;
}

@end
