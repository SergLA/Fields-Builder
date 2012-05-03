//
//  FBFloatFieldCell.h
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FBBaseFieldCell.h"


@interface FBFloatFieldCell : FBBaseFieldCell 
{    
    UILabel *titleLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;

@end
