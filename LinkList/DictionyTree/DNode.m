//
//  DNode.m
//  LinkList
//
//  Created by 张占勇 on 2022/3/23.
//

#import "DNode.h"

@implementation DNode

+ (DNode *)node:(NSString *)value isWord:(BOOL)isWords chiren:(NSMutableDictionary *)chiren {
    DNode *node = [[self alloc]init];
    node.value = value;
    node.isWords = isWords;
    node.chiren = chiren;
    return  node;
}
@end
