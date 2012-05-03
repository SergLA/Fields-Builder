//
//  FBListsProvider.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//


#import "FBListsProvider.h"
#import "FBList.h"

FBListsProvider *_lists = nil;

@interface FBListsProvider()

@property (nonatomic, retain) NSMutableDictionary *lists;

@end


@implementation FBListsProvider

@synthesize lists;

- (id)init
{
    self = [super init];
    if (nil != self) 
    {
        lists = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [lists release];
    _lists = nil;
    
    [super dealloc];
}

+ (FBListsProvider *)lists
{
    if (nil == _lists) 
    {
        _lists = [[FBListsProvider alloc] init];
    }
    return _lists;
}

- (void)addList:(FBList *)aList forID:(NSString *)anID
{
    [self.lists setObject:aList forKey:anID];
}

- (FBList *)listForID:(NSString *)listID
{
    return [self.lists objectForKey:listID];
}

@end
