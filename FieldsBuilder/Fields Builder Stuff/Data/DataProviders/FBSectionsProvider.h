//
//  FBSectionsProvider.h
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//


@interface FBSectionsProvider : NSObject 

+ (FBSectionsProvider *)sections;

@property (nonatomic, readonly) int sectionCount;

- (NSString *)sectionIDAtIndex:(int)anIndex;
- (NSString *)sectionLabelAtIndex:(int)anIndex;

- (void)addSectionWithID:(NSString *)anID andLabel:(NSString *)aLabel;

@end
