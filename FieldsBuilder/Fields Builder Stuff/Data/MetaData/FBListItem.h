//
//  FBListItem.h
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FBListItem : NSObject

@property (nonatomic, readonly) NSString *label;
@property (nonatomic, readonly) NSString *key;

- (id)initWithLabel:(NSString *)aLabel forKey:(NSString *)aKey;

@end
