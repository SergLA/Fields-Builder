//
//  FBBoolFieldCell.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FBBoolFieldCell.h"
#import "FBField.h"

@implementation FBBoolFieldCell

@synthesize titleLabel;
@synthesize valueSwitch;

- (void)dealloc
{
    [titleLabel release];
    [valueSwitch release];
    
    [super dealloc];
}

- (void)setupWithField:(FBField *)aField
{
    [super setupWithField:aField];
    
    self.titleLabel.text = aField.label;
    
    self.valueSwitch.on = [aField.value boolValue];
}

- (IBAction)valueChanged:(id)sender
{
    self.cellField.value = self.valueSwitch.on ? @"YES" : @"NO";
}

@end
