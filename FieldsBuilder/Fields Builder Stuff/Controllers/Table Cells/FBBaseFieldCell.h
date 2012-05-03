//
//  FBBaseFieldCell.h
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//


@class FBField;

@interface FBBaseFieldCell : UITableViewCell 

@property (nonatomic, readonly) FBField *cellField;

- (void)setupWithField:(FBField *)aField;

@end
