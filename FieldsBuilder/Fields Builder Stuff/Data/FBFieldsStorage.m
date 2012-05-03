//
//  FBDataStorage.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FBFieldsStorage.h"
#import "FBField.h"
#import "FBListsProvider.h"
#import "FBSectionsProvider.h"
#import "FBXMLParser.h"

//@interface FBFieldsStorage ()
//
//@property (nonatomic, retain) FBListsProvider *listsProvider;
//@property (nonatomic, retain) FBSectionsProvider *sectionsProvider;
//
//@end

@implementation FBFieldsStorage

@synthesize fields;
//@synthesize listsProvider;
//@synthesize sectionsProvider;

- (id)init
{
    self = [super init];
    
    if (nil != self) 
    {         
        FBXMLParser *parser = [[[FBXMLParser alloc] init] autorelease];
        [parser parseMetaData];
        [parser parseFieldData];
        self->fields = [parser.fields retain];
    }
    
    return self;
}

- (void)dealloc
{
#warning TODO: refactor provider usage to avoid such releasing.
    // Another pattern for list and section usage should be implemented. For now we need to clear 
    // these singletons to avoid extra sections when we show fields several times.
    [[FBListsProvider lists] release];
    [[FBSectionsProvider sections] release];
    
    [fields release];
    
    [super dealloc];
}

- (NSArray *)fieldsForSection:(NSString *)aSection
{
    NSMutableArray *tmpArray = [[[NSMutableArray alloc] init] autorelease];
    
    for (FBField *field in self.fields) 
    {
        if ([field.section isEqualToString:aSection] && field.isVisible) 
        {
            [tmpArray addObject:field];
        }
    }
    
    return tmpArray;
}

- (FBField *)fieldAtIndex:(NSUInteger)anIndex forSection:(NSString *)aSection
{
    return [[self fieldsForSection:aSection] objectAtIndex:anIndex];
}

@end
