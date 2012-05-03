//
//  FBDataStorage.h
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//


#import "FBField.h"


@interface FBFieldsStorage : NSObject 

@property (nonatomic, readonly) NSArray *fields;

- (NSArray *)fieldsForSection:(NSString *)aSection;
- (FBField *)fieldAtIndex:(NSUInteger)anIndex forSection:(NSString *)aSection;

@end
