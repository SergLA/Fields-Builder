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
    self.valueLabel.text = [[[FBListsProvider lists] listForID:aField.type] itemLabelForKey:aField.value];
    
    [self.cellField addObserver:self forKeyPath:kFBFieldValueProperty options:NSKeyValueObservingOptionNew context:nil];
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
