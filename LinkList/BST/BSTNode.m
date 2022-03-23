//
//  BSTNode.m
//  LinkList
//
//  Created by 张占勇 on 2022/3/18.
//

#import "BSTNode.h"

@implementation BSTNode

+(BSTNode *)nodeWith:(NSString *)value left:(BSTNode *)left right:(BSTNode *)right parent:(BSTNode *)parent {
    BSTNode *node = [[self alloc]init];
    node.parent = parent;
    node.left = left;
    node.right = right;
    node.value = value;
    return  node;
}
-(NSString *)description {
    return [NSString stringWithFormat:@"%@",self.value];
}
- (BOOL)isLeaf {
    
    return self.left == nil && self.right == nil;
}
- (BOOL)isTwoChild {
    return self.left != nil && self.right != nil;
}
- (BOOL)leftChild {
    return self.left != nil;
}
- (BOOL)rightChild {
    return self.right != nil;
}
- (void)dealloc {
    
    NSLog(@"dealloc");
}
@end
