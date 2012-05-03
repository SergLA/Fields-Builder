//
//  FBCellFactory.h
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FBField.h"


@interface FBCellFactory : NSObject 

+ (NSString *)cellForField:(NSString *)aFieldType;

@end
