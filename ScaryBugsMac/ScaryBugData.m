//
//  ScaryBugData.m
//  ScaryBugsMac
//
//  Created by 王亮亮 on 15/9/21.
//  Copyright (c) 2015年 王亮亮. All rights reserved.
//

#import "ScaryBugData.h"

@implementation ScaryBugData
- (id)initWithTitle:(NSString*)title rating:(float)rating {
    if ((self = [super init])) {
        self.title = title;
        self.rating = rating;
    }
    return self;
}
@end
