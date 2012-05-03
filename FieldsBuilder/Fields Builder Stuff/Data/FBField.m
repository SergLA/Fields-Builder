//
//  FBField.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FBField.h"


@implementation FBField

@synthesize name;
@synthesize label;
@synthesize value;
@synthesize type;
@synthesize limit;
@synthesize section;
@synthesize isReadonly;
@synthesize isVisible;

- (id)initWithName:(NSString *)aName label:(NSString *)aLabel 
              type:(NSString *)aType limit:(int)aLimit
           section:(NSString *)aSection isReadOnly:(BOOL)aReadOnly
         isVisible:(BOOL)aVisible;
{
    self = [super init];    
    if (nil != self)
    {
        name = [aName copy];
        label = [aLabel copy];
        type = [aType copy];
        limit = aLimit;
        section = [aSection copy];
        isReadonly = aReadOnly;
        isVisible = aVisible;
        
        value = nil;
    }    
    
    return self;
}

- (id)init
{
    [self release];
    return nil;
}

- (void)dealloc
{
    [name release];
    [label release];
    [value release];
    [type release];
    [section release];
    
    [super dealloc];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Field: Name = %@, Value = %@, Label = %@, Type = %@, Section = %@", 
            self.name, self.value, self.label, self.type, self.section];
}

@end
