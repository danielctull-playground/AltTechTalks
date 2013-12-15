//
//  AltTechTalks.h
//  AltTechTalks
//
//  Created by Daniel Tull on 15.12.2013.
//  Copyright (c) 2013 Daniel Tull. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AltTechTalks : NSObject

+ (NSBundle *)bundle;
+ (NSURL *)modelURLForBundle:(NSBundle *)bundle;
+ (NSURL *)storeURLForBundle:(NSBundle *)bundle;

@end
