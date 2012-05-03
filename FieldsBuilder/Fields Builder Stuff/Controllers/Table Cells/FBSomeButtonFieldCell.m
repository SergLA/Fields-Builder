//
//  FBSomeButtonFieldCell.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FBSomeButtonFieldCell.h"


@implementation FBSomeButtonFieldCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [super dealloc];
}

- (IBAction)someButtonTouchInside:(id)sender 
{
    UIAlertView *theAlert = [[[UIAlertView alloc] initWithTitle:@"Fields Builder" message:@"Just an example of custom cell" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
    [theAlert show];
}

@end
