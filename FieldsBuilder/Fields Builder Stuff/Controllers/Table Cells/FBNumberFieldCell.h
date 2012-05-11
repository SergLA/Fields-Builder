//
//  FBNumberFieldCell.h
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FBBaseFieldCell.h"


@interface FBNumberFieldCell : FBBaseFieldCell <UITextFieldDelegate>
{    
    UILabel *titleLabel;
    UITextField *valueTextField;
}

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UITextField *valueTextField;

@end
