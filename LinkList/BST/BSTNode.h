//
//  BSTNode.h
//  LinkList
//
//  Created by 张占勇 on 2022/3/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BSTNode : NSObject
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) BSTNode * __nullable parent;
@property (nonatomic, strong) BSTNode * __nullable left;
@property (nonatomic, strong) BSTNode * __nullable right;
+(BSTNode *)nodeWith:(NSString *)value left:(BSTNode *)left right:(BSTNode *)right parent:(BSTNode *)parent;
- (BOOL)isLeaf;
- (BOOL)isTwoChild;
- (BOOL)leftChild;
- (BOOL)rightChild;
@end

NS_ASSUME_NONNULL_END
