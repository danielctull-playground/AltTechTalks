//
//  ATTParser.m
//  AltTechTalks
//
//  Created by Daniel Tull on 15.12.2013.
//  Copyright (c) 2013 Daniel Tull. All rights reserved.
//

#import "ATTParser.h"

@interface ATTParser ()
@property (nonatomic) NSString *bundle;
@end

@implementation ATTParser

#pragma mark - DDCliApplicationDelegate

- (int)application:(DDCliApplication *)application runWithArguments:(NSArray *)arguments {
	return 0;
}

- (void)application:(DDCliApplication *)application willParseOptions:(DDGetoptLongParser *)optionParser {

	DDGetoptOption optionTable[] = {
        // Long      Short   Argument options
        {@"bundle",  'b',    DDGetoptRequiredArgument},
        {nil,         0,     0},
    };
    [optionParser addOptionsFromTable:optionTable];
}

@end
