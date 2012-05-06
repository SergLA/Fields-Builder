//
//  FBListFieldCell.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FBListFieldCell.h"
#import "FBField.h"
#import "FBListsProvider.h"
#import "FBList.h"

@implementation FBListFieldCell

@synthesize titleLabel;
@synthesize valueLabel;

- (void)dealloc
{
    [self.cellField removeObserver:self forKeyPath:kFBFieldValueProperty];
    
    [titleLabel release];
    [valueLabel release];
    
    [super dealloc];
}

- (void)setupWithField:(FBField *)aField
{
    [super setupWithField:aField];
    
    self.titleLabel.text = aField.label;
    [self.titleLabel sizeToFit];
    self.valueLabel.text = [[[FBListsProvider lists] listForID:aField.type] itemLabelForKey:aField.value];
    
    [self.cellField addObserver:self forKeyPath:kFBFieldValueProperty options:NSKeyValueObservingOptionNew context:nil];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
	
    // We handle TextField frame there to avoid standard resizing mechanizm 'cause it 
    // binded to real screen width (320 or 480 points) even if we have grouped-style for 
    // table (that's why 68 instead of 20+8+20=48 /left space + internal space + right space/). 
    // And there're additional 20 points because list cell has disclosure indicator
    // Also objctive c doesn't provide possibility to bind two frames of one level
    // to each other for resizing handle, only binding to the parent view possible. Or I don't know something :)
    static int theSpaceBetweenControls = 8;
    static int theMagicSpaceValue = 88;  // Helps us to setup proper width for TextField
    
    CGRect theFrame = self.valueLabel.frame;
    theFrame.origin.x = self.titleLabel.frame.origin.x + self.titleLabel.frame.size.width + theSpaceBetweenControls;
    theFrame.size.width = self.frame.size.width - self.titleLabel.frame.size.width - theMagicSpaceValue;
    self.valueLabel.frame = theFrame;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:kFBFieldValueProperty])
    {
        self.valueLabel.text = [[[FBListsProvider lists] listForID:self.cellField.type] 
                                itemLabelForKey:self.cellField.value];
    }
}

@end
