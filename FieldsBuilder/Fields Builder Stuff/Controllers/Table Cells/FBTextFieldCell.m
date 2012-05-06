//
//  TextFieldCell.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FBTextFieldCell.h"
#import "FBField.h"


@implementation FBTextFieldCell

@synthesize titleLabel;
@synthesize valueTextField;

- (void)dealloc
{
    [titleLabel release];
    [valueTextField release];
    
    [super dealloc];
}

- (void)setupWithField:(FBField *)aField
{
    [super setupWithField:aField];
    
    self.titleLabel.text = aField.label;    
    [self.titleLabel sizeToFit];    
    
    self.valueTextField.text = aField.value;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect FFF = self.frame;	
    
    CGRect theFrame = self.valueTextField.frame;
    theFrame.origin.x = self.titleLabel.frame.origin.x + self.titleLabel.frame.size.width + 8;
    theFrame.size.width = self.frame.size.width - 68 - self.titleLabel.frame.size.width;
    self.valueTextField.frame = theFrame;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.cellField.value = textField.text;
    [textField resignFirstResponder];
    
    return YES;    
}

@end
