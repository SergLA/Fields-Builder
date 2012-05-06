//
//  FBFieldsViewController.h
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

@class FBFieldsStorage;
@class FBFieldsDataSource;

@interface FBFieldsViewController : UITableViewController {
    FBFieldsDataSource *dataSource;
}

@property (nonatomic, retain) IBOutlet FBFieldsDataSource *dataSource;

- (id)initWithFieldsStorage:(FBFieldsStorage *)aFieldsStorage;

@end
