//
//  ScaryBugDoc.m
//  ScaryBugsMac
//
//  Created by 王亮亮 on 15/9/21.
//  Copyright (c) 2015年 王亮亮. All rights reserved.
//

#import "ScaryBugDoc.h"

@implementation ScaryBugDoc
- (id)initWithTitle:(NSString*)title rating:(float)rating thumbImage:(NSImage *)thumbImage fullImage:(NSImage *)fullImage {
    if ((self = [super init])) {
        self.data = [[ScaryBugData alloc] initWithTitle:title rating:rating];
        self.thumbImage = thumbImage;
        self.fullImage = fullImage;
    }
    return self;
}
@end
