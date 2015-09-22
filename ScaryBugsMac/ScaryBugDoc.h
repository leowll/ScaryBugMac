//
//  ScaryBugDoc.h
//  ScaryBugsMac
//
//  Created by 王亮亮 on 15/9/21.
//  Copyright (c) 2015年 王亮亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "ScaryBugData.h"

@interface ScaryBugDoc : NSObject
@property (strong) ScaryBugData *data;
@property (strong) NSImage *thumbImage;
@property (strong) NSImage *fullImage;

- (id)initWithTitle:(NSString*)title rating:(float)rating thumbImage:(NSImage *)thumbImage fullImage:(NSImage *)fullImage;

@end
