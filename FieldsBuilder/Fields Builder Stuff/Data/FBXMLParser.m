//
//  FBXMLParser.m
//  FieldsBuilder 
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FBXMLParser.h"
#import "FBList.h"
#import "FBListsProvider.h"
#import "FBSectionsProvider.h"
#import "FBField.h"

typedef enum 
{
    pdNone,
    pdLists,
    pdSection,
	pdFields,
}
ParsingData;

typedef enum
{
    psReady,
    psWaitForName,
    psWaitForType,
    psWaitForLimit,
    psWaitForValue,
    psWaitForRequired,
    psWaitForVisible,
    psWaitForSection,
}
ParserState;

@interface FBXMLParser()
@property (nonatomic) ParserState state;
@property (nonatomic) ParsingData parsingData;
@property (nonatomic, retain) NSMutableArray *_fields;
@property (nonatomic, retain) FBField *tmpField;

@property (nonatomic, retain) NSString *fieldName;
@property (nonatomic, retain) NSString *fieldValue;
@property (nonatomic, retain) NSString *fieldLabel;
@property (nonatomic, retain) NSString *fieldType;
@property (nonatomic, retain) NSString *fieldSection;
@property (nonatomic) int fieldLimit;
@property (nonatomic) BOOL fieldIsReadonly;
@property (nonatomic) BOOL fieldIsVisible;

@property (nonatomic, retain) FBList *tmpList;
@end

@implementation FBXMLParser

@synthesize state;
@synthesize parsingData;
@synthesize _fields;
@synthesize tmpField;
@synthesize fieldName;
@synthesize fieldValue;
@synthesize fieldLabel;
@synthesize fieldType;
@synthesize fieldSection;
@synthesize fieldLimit;
@synthesize fieldIsReadonly;
@synthesize fieldIsVisible;
@synthesize tmpList;
@dynamic fields;

- (id)init
{
    self = [super init];
    if (nil != self) 
    {
        _fields = [[NSMutableArray alloc] init];
        tmpField = nil;
        tmpList = nil;
        
        parsingData = pdNone;
        state = psReady;
    }
    
    return self;
}

- (void)dealloc
{
    [_fields release];
    [tmpField release];
    
    [fieldName release];
    [fieldValue release];
    [fieldLabel release];
    [fieldType release];
    [fieldSection release];
    
    [tmpList release];
    
    [super dealloc];
}

- (NSArray *)fields
{
    return self._fields;
}

- (void)parseMetaData
{
    NSString *metaDataFile = [[NSBundle mainBundle] pathForResource:@"metadata" ofType:@"xml"];
    
    NSData *data = [[[NSData alloc] initWithContentsOfFile:metaDataFile] autorelease];
    NSXMLParser *parser = [[[NSXMLParser alloc] initWithData:data] autorelease];

    [parser setDelegate:self];
    [parser parse];
}

- (void)parseFieldData
{
    NSString *fieldsDataFile = [[NSBundle mainBundle] pathForResource:@"fields" ofType:@"xml"];
    
    NSData *data = [[[NSData alloc] initWithContentsOfFile:fieldsDataFile] autorelease];
    NSXMLParser *parser = [[[NSXMLParser alloc] initWithData:data] autorelease];
    
    [parser setDelegate:self];
    [parser parse];
}

#pragma mark - NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"lists"]) 
    {
        self.parsingData = pdLists;
    }
    if ([elementName isEqualToString:@"sections"]) 
    {
        self.parsingData = pdSection;
    }
    if ([elementName isEqualToString:@"fields"]) 
    {
        self.parsingData = pdFields;
    }
    
    // MetaData Part
    {
        if ([elementName isEqualToString:@"list"]) 
        {
            self.tmpList = [[FBList alloc] initWithListID:[attributeDict objectForKey:@"id"]];
        }
        
        if ([elementName isEqualToString:@"listitem"]) 
        {
            [self.tmpList setItemLabel:[attributeDict objectForKey:@"label"] forItemKey:[attributeDict objectForKey:@"key"]];
        }
        
        if ([elementName isEqualToString:@"section"] && self.parsingData == pdSection) 
        {
            [[FBSectionsProvider sections] addSectionWithID:[attributeDict objectForKey:@"id"] andLabel:[attributeDict objectForKey:@"label"]];
        }
    }
    
    // Fields Part
    {
        self.state = psReady;
        
        if ([elementName isEqualToString:@"field"]) 
        {
            self.fieldLabel = [attributeDict objectForKey:@"label"];
        }
        if ([elementName isEqualToString:@"name"]) 
        {
            self.state = psWaitForName;
        }
        if ([elementName isEqualToString:@"type"]) 
        {
            self.state = psWaitForType;
        }
        if ([elementName isEqualToString:@"limit"]) 
        {
            self.state = psWaitForLimit;
        }
        if ([elementName isEqualToString:@"value"]) 
        {
            self.state = psWaitForValue;
        }
        if ([elementName isEqualToString:@"required"]) 
        {
            self.state = psWaitForRequired;
        }
        if ([elementName isEqualToString:@"visible"]) 
        {
            self.state = psWaitForVisible;
        }
        if ([elementName isEqualToString:@"section"] && self.parsingData == pdFields) 
        {
            self.state = psWaitForSection;
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (self.parsingData != pdFields) 
    {
        return;
    }
    
    switch (self.state)
    {
        case psWaitForName:
            self.fieldName = string;
            break;        
        case psWaitForType:
            self.fieldType = string;
            break;
        case psWaitForLimit:
            self.fieldLimit = [string intValue];
            break;
        case psWaitForValue:
            self.fieldValue = string;
            break;
        case psWaitForRequired:
            self.fieldIsReadonly = [string boolValue];
            break;
        case psWaitForVisible:
            self.fieldIsVisible = [string boolValue];
            break;
        case psWaitForSection:
            self.fieldSection = string;
            break;            
        default:
            break;
    }
    self.state = psReady;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{    
    // MetaData Part
    {
        if ([elementName isEqualToString:@"list"]) 
        {
            [[FBListsProvider lists] addList:self.tmpList forID:self.tmpList.listID];
            self.tmpList = nil;
        }
    }
    
    //Fields Part
    {
        if ([elementName isEqualToString:@"field"]) 
        {
            self.tmpField = [[FBField alloc] initWithName:self.fieldName
                                                    label:self.fieldLabel 
                                                     type:self.fieldType
                                                    limit:self.fieldLimit
                                                  section:self.fieldSection
                                               isReadOnly:self.fieldIsReadonly 
                                                isVisible:self.fieldIsVisible];
            self.tmpField.value = self.fieldValue;
            [self._fields addObject:self.tmpField];

            self.fieldName = nil;
            self.fieldValue = nil;
            self.fieldLabel = nil;
            self.fieldType = nil;
            self.fieldLimit = -1;
            self.fieldSection = nil;
            self.fieldIsReadonly = FALSE;
            self.fieldIsVisible = FALSE;
        }
    }
}

@end
