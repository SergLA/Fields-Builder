//
//  FBFloatFieldCell.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FBFloatFieldCell.h"
#import "FBField.h"

@implementation FBFloatFieldCell

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
	
    // We handle TextField frame there to avoid standard resizing mechanizm 'cause it 
    // binded to real screen width (320 or 480 points) even if we have grouped-style for 
    // table (that's why 68 instead of 20+8+20=48 /left space + internal space + right space/). 
    // Also objctive c doesn't provide possibility to bind two frames of one level
    // to each other for resizing handle, only binding to the parent view possible. Or I don't know something :)
    static int theSpaceBetweenControls = 8;
    static int theMagicSpaceValue = 68;  // Helps us to setup proper width for TextField
    
    CGRect theFrame = self.valueTextField.frame;
    theFrame.origin.x = self.titleLabel.frame.origin.x + self.titleLabel.frame.size.width + theSpaceBetweenControls;
    theFrame.size.width = self.frame.size.width - self.titleLabel.frame.size.width - theMagicSpaceValue;
    self.valueTextField.frame = theFrame;
}

- (void)textFieldDidEndEditing:(UITextField *)aTextField
{
    if (![self.cellField.value isEqualToString:aTextField.text])
    {
        self.cellField.value = aTextField.text;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)aTextField
{    
    [aTextField resignFirstResponder];
    
    return YES;    
}

- (BOOL)textField:(UITextField *)aTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *theResultString = [aTextField.text stringByReplacingCharactersInRange:range 
                                                                         withString:string];
    
    NSString *theFloatPattern = @"^[0-9]*\\.?[0-9]*$";
    
    NSRegularExpression *theRegExp = [NSRegularExpression regularExpressionWithPattern:theFloatPattern 
                                                                               options:NSRegularExpressionCaseInsensitive 
                                                                                 error:NULL];
    
    NSUInteger theMatches = [theRegExp numberOfMatchesInString:theResultString 
                                                       options:NSMatchingReportCompletion 
                                                         range:NSMakeRange(0, [theResultString length])];
    
    BOOL theLessThenLimit = (self.cellField.limit > 0) ? ([theResultString length] <= self.cellField.limit) : TRUE;
    
    BOOL res = (theMatches != 0) && (theLessThenLimit);
    
    return res;
}

@end
