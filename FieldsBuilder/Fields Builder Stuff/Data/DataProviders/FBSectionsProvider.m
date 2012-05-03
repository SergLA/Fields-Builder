//
//  FBSectionsProvider.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//


#import "FBSectionsProvider.h"
#import "FBSectionItem.h"


FBSectionsProvider *_sections = nil;


@interface FBSectionsProvider ()

@property (nonatomic, retain) NSMutableArray *sections;

@end


@implementation FBSectionsProvider

@synthesize sections;
@dynamic sectionCount;

+ (FBSectionsProvider *)sections
{
    if (nil == _sections)
    {
        _sections = [[FBSectionsProvider alloc] init];
    }
    return _sections;
}

- (id)init
{
    self = [super init];
    if (nil != self)
    {
        sections = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)dealloc
{
    [sections release];
    _sections = nil;
    
    [super dealloc];
}

- (int)sectionCount
{
    return [self.sections count];
}

- (NSString *)sectionIDAtIndex:(int)anIndex
{
    FBSectionItem *item = [self.sections objectAtIndex:anIndex];
    return item.sectionID;
}

- (NSString *)sectionLabelAtIndex:(int)anIndex
{
    FBSectionItem *item = [self.sections objectAtIndex:anIndex];
    return item.sectionLabel;
}

- (void)addSectionWithID:(NSString *)anID andLabel:(NSString *)aLabel
{
    FBSectionItem *item = [[[FBSectionItem alloc] init] autorelease];
    item.sectionID = anID;
    item.sectionLabel = aLabel;
    
    [self.sections addObject:item];
}

@end
