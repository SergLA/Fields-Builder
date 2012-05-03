//
//  FBListsProvider.h
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//


@class FBList;


@interface FBListsProvider: NSObject 

+ (FBListsProvider *)lists;

- (void)addList:(FBList *)aList forID:(NSString *)anID;
- (FBList *)listForID:(NSString *)listID;

@end
