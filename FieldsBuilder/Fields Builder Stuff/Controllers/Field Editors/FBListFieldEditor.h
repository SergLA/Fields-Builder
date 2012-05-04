//
//  FBListFieldEditor.h
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

@class FBField;

@interface FBListFieldEditor : UIViewController <UITableViewDataSource, UITableViewDelegate> 
{
    UITableView *listTableView;
}

@property (nonatomic, retain) IBOutlet UITableView *listTableView;

- (id)initWithField:(FBField *)aField;

@end
