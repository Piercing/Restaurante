//
//  DataBase.h
//  iphone4peru.com
//
//  Created by MacBook Pro on 17/12/15.
//  Copyright © 2015 Juan Carlos Merlos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBase : NSObject
+(NSString *)getDataBasePath;
+(void) checkAndCreateDatabase;
- (NSArray *)ejecutarSelect:(NSString *)select;
- (void)ejecutarInsert:(NSString *)insert;
- (void)ejecutarDelete:(NSString *)deleteString;
- (void)ejecutarUpdate:(NSString *)update;
@end
