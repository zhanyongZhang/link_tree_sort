//
//  BSTList.m
//  LinkList
//
//  Created by 张占勇 on 2022/3/18.
//

#import "BSTList.h"
#import "BSTQueue.h"

@implementation BSTList


- (BOOL)isEmpty {
    return  self.size == 0;
}
- (void)clear {
    
}
- (void)addElement:(NSString *)element {
    
    if(_root == nil) {
        _root = [self createNode:element left:nil right:nil parent:nil];
        _size++ ;
        return;
    }
    BSTNode *node = _root;
    BSTNode *curr = node;
    NSInteger cmp = 0;
    while (node != nil) {
        
        if ([element intValue] < [node.value intValue]) {
            curr = node;
            node = node.left;
            cmp = -1;
        } else if ([element intValue] > [node.value intValue]){
            curr = node;
            node = node.right;
            cmp = 1;
        } else {
            
            return;
        }
    }
    BSTNode *insert =  [self createNode:element left:nil right:nil parent:nil];
    if (cmp < 0) {
        curr.left = insert;
        insert.parent = curr;
    } else if (cmp > 0) {
        curr.right = insert;
        insert.parent = curr;
    }
    _size++;
}

- (BSTNode *)createNode:(NSString *)element left:(BSTNode *)left right:(BSTNode *)right parent:(BSTNode *)parent{
    
    return [BSTNode nodeWith:element left:left right:right parent:parent];
}

-(void)removeElement:(NSString *)element {
    if (_size == 0)return;
    BSTNode *node = _root;
    BSTNode *deletN = nil;
    NSInteger cmp = 0;
    while (node != nil) {
        if ([element intValue] < [node.value intValue]) {
            node = node.left;
            cmp = -1;
        } else if ([element intValue] > [node.value intValue]){
            node = node.right;
            cmp = 1;
        } else {
            deletN = node;
            break;
        }
    }
    if (deletN == nil)return;
   
    if (_size == 1){
        _root = nil;
        _size--;
        return;
    }
    _size--;
    if ([deletN isTwoChild]) {
        BSTNode *back = [self backNode:deletN];
        deletN.value = back.value;
        deletN = back;
    }
    if ([deletN isLeaf]) {
        (cmp > 0) ? (deletN.parent.right = nil) : (deletN.parent.left = nil);
        deletN.parent = nil;
        deletN = nil;
        return;
    }
    
    if ([deletN rightChild]) {
        deletN.parent.right = deletN.right;
        deletN.right.parent = deletN.parent;
        deletN = nil;
    } else {
        deletN.parent.left = deletN.left;
        deletN.left.parent = deletN.parent;
        deletN = nil;
    }
}
- (BSTNode *)backNode:(BSTNode *)node {
    node = node.right;
    BSTNode *curr = node;
    while (node.left != nil) {
        node = node.left;
        curr = node;
    }
    return curr;
}
//后序遍历

- (void)tralveElement:(BSTBlock)block {
    
    NSMutableArray *stack = [NSMutableArray array];
    [stack addObject:_root];
    BSTNode *pre= nil;
    while (stack.count != 0) {
        BSTNode *top = [stack lastObject];
        if ([top isLeaf] || (pre != nil && pre.parent == top)){
            pre = [stack lastObject];
            [stack removeLastObject];
            block(pre);
            
        } else {
            if (top.right != nil) {
                [stack addObject:top.right];
            }
            if (top.left != nil) {
                [stack addObject:top.left];
            }
        }
    }
}



//中序遍历
//- (void)tralveElement:(BSTBlock)block {
//
//    BSTNode *node = _root;
//    NSMutableArray *stack = [NSMutableArray array];
//    while (true) {
//        if (node != nil) {
//            [stack addObject:node];
//            node = node.left;
//        } else {
//            if (stack.count == 0)return;
//            node = [stack lastObject];
//            block(node);
//            [stack removeLastObject];
//            node = node.right;
//        }
//    }
//}


////前序遍历
//- (void)tralveElement:(BSTBlock)block {
//
//    BSTNode *node = _root;
//    NSMutableArray *stack = [NSMutableArray array];
//    while (true) {
//        if (node != nil) {
//            block(node);
//            if(node.right != nil){
//                [stack addObject:node.right];
//            }
//            node = node.left;
//        } else {
//            if(stack.count == 0)return;
//            node = stack[stack.count -1];
//            [stack removeLastObject];
//        }
//    }
//}
// 层序遍历

//- (void)tralveElement:(BSTBlock)block {
//
//    BSTNode *node = _root;
//    BSTQueue *queue = [[BSTQueue alloc]init];
//    [queue pushObject:node];
//    while (![queue isEmpty]) {
//        node = [queue pop];
//        block(node);
//        if (node.left != nil) {
//            [queue pushObject:node.left];
//        }
//        if (node.right != nil) {
//            [queue pushObject:node.right];
//        }
//    }
//}
@end
