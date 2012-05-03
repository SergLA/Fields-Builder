//
//  FBFieldsDataSource.h
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

@class FBBaseFieldCell;
@class FBFieldsStorage;

@interface FBFieldsDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, retain) FBFieldsStorage *fieldsStorage;
@property (nonatomic, retain) IBOutlet FBBaseFieldCell *tmpCell;

@end
