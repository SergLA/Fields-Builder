//
//  FBFieldsDataSource.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//


#import "FBFieldsDataSource.h"
#import "FBField.h"
#import "FBFieldsStorage.h"
#import "FBCellFactory.h"
#import "FBBaseFieldCell.h"
#import "FBSectionsProvider.h"


@implementation FBFieldsDataSource

@synthesize fieldsStorage;
@synthesize tmpCell;

- (void)dealloc
{
    [tmpCell release];
    [fieldsStorage release];
    
    [super dealloc];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[FBSectionsProvider sections] sectionCount];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[FBSectionsProvider sections] sectionLabelAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{    
    return [[self.fieldsStorage fieldsForSection:[[FBSectionsProvider sections] sectionIDAtIndex:section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *theSection = [[FBSectionsProvider sections] sectionIDAtIndex:indexPath.section];
    FBField *theField = [self.fieldsStorage fieldAtIndex:indexPath.row 
                                              forSection:theSection];
    
    NSString *theIdentifier = [FBCellFactory cellForField:theField.type];
    
    FBBaseFieldCell *theCell = (FBBaseFieldCell *)[tableView dequeueReusableCellWithIdentifier:theIdentifier];
    if (nil == theCell) 
    {
        [[NSBundle mainBundle] loadNibNamed:theIdentifier owner:self options:nil];
        theCell = [self.tmpCell retain];
        [self.tmpCell release];
    }
    
    [theCell setupWithField:theField];
    
    return theCell;
}

@end
