//
//  FBCellFactory.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//


#import "FBCellFactory.h"


@implementation FBCellFactory

+ (NSString *)cellForField:(NSString *)aFieldType
{
    NSString *cellNibName = nil;
    
    if ([aFieldType isEqualToString:@"int"])
    {
        cellNibName = @"FBNumberFieldCell";
    }
    else if ([aFieldType isEqualToString:@"float"])
    {
        cellNibName = @"FBFloatFieldCell";
    }
    else if ([aFieldType hasPrefix:@"list_"])
    {
        cellNibName = @"FBListFieldCell";
    }
    else if ([aFieldType isEqualToString:@"bool"])
    {
        cellNibName = @"FBBoolFieldCell";
    }
    else if ([aFieldType isEqualToString:@"some_special_type"])
    {
        cellNibName = @"FBSomeButtonFieldCell";
    }
    else if ([aFieldType isEqualToString:@"string"])
    {
        cellNibName = @"FBTextFieldCell";
    }
    else
    {
        cellNibName = @"FBTextFieldCell";
        NSLog(@"Wrong field type: %@", aFieldType);
    }
    
    return cellNibName;
}

@end
