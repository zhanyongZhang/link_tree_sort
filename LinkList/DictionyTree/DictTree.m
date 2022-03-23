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
        _root = [DNode node:nil isWord:NO chiren:[NSMutableDictionary dictionary]];
    }
    return self;
}
- (void)clear {
    _size = 0;
    [_root.chiren removeAllObjects];
}
- (BOOL)isEmpty {
    return _size == 0;
}
//- (DNode *)nodeFor:(NSString *)element {
//
//    DNode *nodel = _root;
//    for(NSInteger i = 0; i < element.length;i++) {
//        NSString *charS = [NSString stringWithFormat:@"%c",i];
//        
//    }
//}
- (void)addElenment:(NSString *)element {
    
    if(_size == 0) {
        _root = [DNode node:@"" isWord:NO chiren:[NSMutableDictionary dictionary]];
    }
    NSMutableDictionary *chirenP = _root.chiren;
//dog
    for (NSInteger i = 0; i < element.length; i++) {
         NSString *charS = [NSString stringWithFormat:@"%c",[element characterAtIndex:i]];
        if (chirenP.allKeys.count == 0) {
            DNode *node = [DNode node:@"" isWord:NO chiren:[NSMutableDictionary dictionary]];
            [chirenP setValue:node forKey:charS];
        } else {
            DNode *node = [chirenP valueForKey:charS];
            

        }
    }
}

@end
