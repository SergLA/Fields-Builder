//
//  FBListItem.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FBListItem.h"


@implementation FBListItem

@synthesize label;
@synthesize key;

- (id)initWithLabel:(NSString *)aLabel forKey:(NSString *)aKey
{
    self = [super init];
    if (nil != self)
    {
        self->label = [aLabel copy];
        self->key = [aKey copy];
    }
    
    return self;
}

@end
