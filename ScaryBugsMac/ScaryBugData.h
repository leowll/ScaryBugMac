//
//  ScaryBugData.h
//  ScaryBugsMac
//
//  Created by 王亮亮 on 15/9/21.
//  Copyright (c) 2015年 王亮亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScaryBugData : NSObject
@property (strong) NSString *title;
@property (assign) float rating;

- (id)initWithTitle:(NSString*)title rating:(float)rating;

@end
