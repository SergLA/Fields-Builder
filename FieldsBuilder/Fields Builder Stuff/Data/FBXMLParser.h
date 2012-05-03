//
//  FBXMLParser.h
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//


@interface FBXMLParser : NSObject <NSXMLParserDelegate>

@property (nonatomic, readonly) NSArray *fields;

- (void)parseMetaData;
- (void)parseFieldData;

@end
