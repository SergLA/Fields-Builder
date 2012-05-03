//
//  FBList.h
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

@interface FBList : NSObject

@property (nonatomic, readonly) NSString *listID;
@property (nonatomic, readonly) NSInteger count;

- (id)initWithListID:(NSString *)aListID;
- (void)setItemLabel:(NSString *)anLabel forItemKey:(NSString *)aKey;

- (NSString *)itemLabelForKey:(NSString *)aKey;
- (NSString *)itemKeyForLabel:(NSString *)aLabel;
- (NSString *)itemLabelForIndex:(NSInteger)anIndex;
- (NSString *)itemKeyForIndex:(NSInteger)anIndex;

@end