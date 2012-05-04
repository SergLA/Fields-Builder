//
//  FBField.h
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//


// property names for KVO stuff
NSString *kFBFieldValueProperty;


@interface FBField : NSObject 

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *label;
@property (nonatomic, readonly) NSString *type;
@property (nonatomic, readonly) int limit;
@property (nonatomic, readonly) NSString *section;
@property (nonatomic, readonly) BOOL isReadonly;
@property (nonatomic, readonly) BOOL isVisible;
@property (nonatomic, copy) NSString *value;

- (id)initWithName:(NSString *)aName label:(NSString *)aLabel 
              type:(NSString *)aType limit:(int)aLimit
           section:(NSString *)aSection isReadOnly:(BOOL)aReadOnly
         isVisible:(BOOL)aVisible;

@end
