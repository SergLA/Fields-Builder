//
//  FBMainView.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//


#import "FBMainView.h"
#import "FBFieldsStorage.h"
#import "FBFieldsViewController.h"


@implementation FBMainView

- (NSString *)nibName
{
    return @"FBMainView";
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:[self nibName] bundle:nibBundleOrNil];
    if (self) 
    {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Event Handlers

- (IBAction)generateUITouchInside:(id)sender 
{
    FBFieldsStorage *theStorage = [[[FBFieldsStorage alloc] init] autorelease];
    FBFieldsViewController *theFieldsViewController = [[[FBFieldsViewController alloc] initWithFieldsStorage:theStorage] autorelease];
    
    [self.navigationController pushViewController:theFieldsViewController animated:YES];
}

@end
