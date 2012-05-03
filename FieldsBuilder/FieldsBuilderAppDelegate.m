//
//  FieldsBuilderAppDelegate.m
//  FieldsBuilder
//
//  Created by Sergey Lantratov on 5/3/12.
//  Copyright 2012 Sergey Lantratov. All rights reserved.
//

#import "FieldsBuilderAppDelegate.h"
#import "FBMainView.h"

@implementation FieldsBuilderAppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    FBMainView *theMainView = [[FBMainView new] autorelease];
    UINavigationController *theNavigationController = [[[UINavigationController alloc] initWithRootViewController:theMainView] autorelease];
    
    [self.window setRootViewController:theNavigationController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
