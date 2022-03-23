//
//  BSTList.h
//  LinkList
//
//  Created by 张占勇 on 2022/3/18.
//

#import <Foundation/Foundation.h>
#import "BSTNode.h"

typedef void (^BSTBlock)(BSTNode *_Nullable);

NS_ASSUME_NONNULL_BEGIN

@interface BSTList : NSObject
@property (nonatomic, strong) BSTNode * __nullable root;
@property (nonatomic, assign) int size;
- (BOOL)isEmpty;
- (void)clear;
-(void)addElement:(NSString *)element;
- (void)removeElement:(NSString *)element;
- (void)tralveElement:(BSTBlock)block;
@end

NS_ASSUME_NONNULL_END
