//
//  DictTree.m
//  LinkList
//
//  Created by 张占勇 on 2022/3/23.
//

#import "DictTree.h"

@interface DictTree ()

@end

@implementation DictTree

- (instancetype)init {
    if([super init]) {
    }
    return self;
}
- (void)clear {
    _size = 0;
    _root = nil;
}
- (BOOL)isEmpty {
    return _size == 0;
}
- (NSString *)get:(NSString *)key {
    DNode *nodel = [self nodeFor:key];
    if(!nodel) return nil;
    return !nodel.isWords ? nil : nodel.value;
}
- (BOOL)containElement:(NSString *)key {
    DNode *nodel = [self nodeFor:key];
    return !nodel ? NO : YES;
}
- (BOOL)startWith:(NSString *)key {
    DNode *nodel = _root;
    if(!nodel || nodel.chiren.allKeys.count == 0) return NO;
    for(NSInteger i = 0; i < key.length;i++) {
        NSString *charS = [NSString stringWithFormat:@"%c",[key characterAtIndex:i]];
        nodel = [nodel.chiren valueForKey:charS];
        if(!nodel)return NO;
    }
    return YES;
}
- (DNode *)nodeFor:(NSString *)key {
    
    DNode *nodel = _root;
    for(NSInteger i = 0; i < key.length;i++) {
        NSString *charS = [NSString stringWithFormat:@"%c",[key characterAtIndex:i]];
        if(!nodel || nodel.chiren.allKeys.count == 0)return nil;
        nodel = [nodel.chiren valueForKey:charS];
    }
    return nodel;
}
- (void)addElenment:(NSString *)key {
    
    if (!_root){
        _root = [DNode node:nil isWord:NO chiren:[NSMutableDictionary dictionary]];
    }
    DNode *nodel = _root;
    for (NSInteger i = 0; i < key.length; i++) {
        NSString *charS = [NSString stringWithFormat:@"%c",[key characterAtIndex:i]];
        DNode *child = [nodel.chiren valueForKey:charS];
        if(child == nil) {
            child = [DNode node:nil isWord:NO chiren:[NSMutableDictionary dictionary]];
        }
        [nodel.chiren setValue:child forKey:charS];
        child.charS = charS;
        child.parent = nodel;
        nodel = child;
    }
    if(!nodel.isWords){
        nodel.isWords = YES;
        nodel.value = key;
        _size++;
    }
}
- (void)remove:(NSString *)key {
    if(!_root || _root.chiren.allKeys.count == 0) return;
    DNode *node = [self nodeFor:key];
    if(!node || !node.isWords)return;
    if(node.chiren && node.chiren.allKeys.count > 0) {
        node.isWords = NO;
        node.value = key;
        _size--;
        return;
    }
    DNode *parent = node.parent;
    _size--;
    while (parent) {
        [parent.chiren removeObjectForKey:node.charS];
        if(parent.isWords && parent.chiren.allKeys.count > 0)return;
        node = parent;
        parent = node.parent;
    }
}
@end
