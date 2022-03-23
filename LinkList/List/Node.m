//
//  Node.m
//  LinkList
//
//  Created by 张占勇 on 2022/3/18.
//

#import "Node.h"

@implementation Node

+ (Node *)nodeWith:(NSString *)value next:(Node *)next prev:(Node *)prev{
    Node *node = [[self alloc]init];
    node.value = value;
    node.next = next;
    node.prev = prev;
    return  node;;
}
- (NSString *)description {
    return [NSString stringWithFormat:@"%@",self.value];
}
- (void)dealloc {
    NSLog(@"dealloc");
}

@end
