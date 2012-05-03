//
//  FBBoolFieldCell.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FBBoolFieldCell.h"


@implementation FBBoolFieldCell

@synthesize titleLabel;
@synthesize valueSwitch;

- (void)dealloc
{
    [titleLabel release];
    [valueSwitch release];
    [super dealloc];
}

@end
