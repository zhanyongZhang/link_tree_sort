//
//  LinkList.m
//  LinkList
//
//  Created by 张占勇 on 2022/3/18.
//

#import "LinkList.h"

@implementation LinkList

- (BOOL)isEmpty {
    return self.size == 0;
}
- (void)clear {
   
    if(self.first == nil)return;
    self.size = 0;
    Node *node = self.first;
    do {
        node = node.next;
        node.prev = nil;
            
    } while (node != nil);
    self.first = nil;
}
-(void)addElement:(NSString *)element {
    
    Node *node = [self createNode:element next:nil prev:nil];
    if(self.first == nil) {
        self.first = node;
        _size ++;
        return;
    }
    Node *lastNode = _first;
    while (lastNode.next != nil) {
        lastNode = lastNode.next;
    }
    lastNode.next = node;
    node.prev = lastNode;
    _size ++;
}

- (Node *)createNode:(NSString *)element next:(Node *)next prev:(Node *)prev{
    
    return [Node nodeWith:element next:next prev:prev];
}

-(void)removeElement:(NSString *)element {
    if (_first == nil) return;
    Node *lastNode = _first;
    Node *deleteN = nil;
    Node *preN = nil;
    while (lastNode != nil) {
        NSString *value = lastNode.value;
        if([value isEqual:element]){
            deleteN = lastNode;
            break;
        }
        preN = lastNode;
        lastNode = lastNode.next;
    }
    if (deleteN == nil) return;
    _size --;
    if (preN == nil){
        _first = _first.next;
        _first.prev = nil;
        return;
    }
    if (deleteN.next == nil ) {
        preN.next = nil;
        deleteN.prev = nil;
        return;
    }
    preN.next = deleteN.next;
    deleteN.next.prev = preN;
}
- (void)tralveElement:(Block)block {
    
    if (_first == nil) return;
    Node *lastNode = _first;
    while (lastNode != nil) {
        block(lastNode);
        lastNode = lastNode.next;
    }
}
@end
