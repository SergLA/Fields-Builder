//
//  FBFieldsViewController.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FBFieldsViewController.h"
#import "FBFieldsStorage.h"
#import "FBFieldsDataSource.h"
#import "FBBaseFieldCell.h"
#import "FBListFieldEditor.h"


@interface FBFieldsViewController ()

@property (nonatomic, retain) FBFieldsStorage *fieldsStorage;

@end


@implementation FBFieldsViewController

@synthesize dataSource;
@synthesize fieldsStorage;

- (NSString *)nibName
{
    return @"FBFieldsView";
}

- (id)initWithFieldsStorage:(FBFieldsStorage *)aFieldsStorage
{
    self = [super initWithNibName:[self nibName] bundle:nil];
    if (self) 
    {
        NSAssert(aFieldsStorage != nil, @"Fields Storage couldn't be nil.");
        self->fieldsStorage = [aFieldsStorage retain];
    }
    return self;
}

- (id)init
{
    NSAssert(FALSE, @"FBFieldsViewController should be initialized with initWithFieldsStorage: only.");
    return nil;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    NSAssert(FALSE, @"FBFieldsViewController should be initialized with initWithFieldsStorage: only.");
    return nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSAssert(FALSE, @"FBFieldsViewController should be initialized with initWithFieldsStorage: only.");
    return nil;
}

- (void)dealloc
{
    [fieldsStorage release];
    [dataSource release];
    
    [super dealloc];
}

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataSource.fieldsStorage = self.fieldsStorage;
}

- (void)viewDidUnload 
{
    [self setDataSource:nil];
    [super viewDidUnload];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    FBBaseFieldCell *theCell = (FBBaseFieldCell *)[tableView cellForRowAtIndexPath:indexPath];
    if ([theCell.cellField.type hasPrefix:@"list_"])
    {
        FBListFieldEditor *theListFieldEditor = [[[FBListFieldEditor alloc] initWithField:theCell.cellField] autorelease];
        [self.navigationController pushViewController:theListFieldEditor animated:YES];
    }
}

@end
