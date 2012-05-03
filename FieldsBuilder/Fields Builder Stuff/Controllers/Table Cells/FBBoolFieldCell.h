//
//  FBBoolFieldCell.h
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FBBaseFieldCell.h"


@interface FBBoolFieldCell : FBBaseFieldCell
{
    UILabel *titleLabel;
    UISwitch *valueSwitch;
}

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UISwitch *valueSwitch;

@end
