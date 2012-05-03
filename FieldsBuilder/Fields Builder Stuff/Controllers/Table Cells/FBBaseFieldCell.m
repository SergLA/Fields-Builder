//
//  FBBaseFieldCell.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//


#import "FBBaseFieldCell.h"
#import "FBField.h"


@interface FBBaseFieldCell () 

@property (nonatomic, retain) FBField *field;

@end


@implementation FBBaseFieldCell

@synthesize field;
@dynamic cellField;

- (FBField *)cellField
{
    return self.field;
}

- (void)setupWithField:(FBField *)aField
{
    self.field = aField;
    NSLog(@"BaseFieldCell setupWithField: were called!");
}

@end
