//
//  BSTQueue.h
//  LinkList
//
//  Created by 张占勇 on 2022/3/18.
//

#import <Foundation/Foundation.h>
#import "BSTNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface BSTQueue : NSObject
@property (nonatomic, assign) int size;
- (BOOL)isEmpty;
- (void)pushObject:(BSTNode *)object;
- (BSTNode *)pop;
@end

NS_ASSUME_NONNULL_END
