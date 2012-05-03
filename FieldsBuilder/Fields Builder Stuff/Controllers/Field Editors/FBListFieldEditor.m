//
//  FBListFieldEditor.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FBListFieldEditor.h"
#import "FBField.h"
#import "FBListsProvider.h"
#import "FBList.h"


@interface FBListFieldEditor ()

@property (nonatomic, retain) FBField *field;
@property (nonatomic, retain) FBList *list;

@end


@implementation FBListFieldEditor

@synthesize field;
@synthesize list;

- (id)init
{
    NSAssert(FALSE, @"FBListFieldEditor should be initialized with initWithField: only.");
    return nil;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    NSAssert(FALSE, @"FBListFieldEditor should be initialized with initWithField: only.");
    return nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSAssert(FALSE, @"FBListFieldEditor should be initialized with initWithField: only.");
    return nil;
}

- (id)initWithField:(FBField *)aField;
{
    self = [super initWithNibName:@"FBListFieldEditor" bundle:nil];
    if (self) 
    {
        self->field = [aField retain];
        self->list = [[FBListsProvider lists] listForID:aField.type];
    }
    return self;
}

- (void)dealloc
{
    [field release];
    [list release];
    
    [super dealloc];
}

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kListItemCell = @"FBListItemCell";
    
    UITableViewCell *theCell = [tableView dequeueReusableCellWithIdentifier:kListItemCell];
    if (nil == theCell)
    {
        theCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kListItemCell] autorelease];
    }
    
    theCell.textLabel.text = [self.list itemLabelForIndex:indexPath.row];
    
    return theCell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
