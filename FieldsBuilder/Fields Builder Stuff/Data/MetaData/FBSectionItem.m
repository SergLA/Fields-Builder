//
//  FBSectionItem.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FBSectionItem.h"


@implementation FBSectionItem

@synthesize sectionID;
@synthesize sectionLabel;

- (void)dealloc
{
    [sectionID release];
    [sectionLabel release];
    
    [super dealloc];
}

@end
