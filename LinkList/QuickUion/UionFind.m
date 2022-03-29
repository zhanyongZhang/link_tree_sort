//
//  QuickUion.m
//  LinkList
//
//  Created by 张占勇 on 2022/3/28.
//

#import "UionFind.h"

@implementation UionFind

- (instancetype)initWith:(NSArray *)elements {
    if([super init]) {
        
    }
    return self;
}

- (NSString *_Nullable)find:(NSString *)value {
    return nil;
}
- (void)uion:(NSString *)one other:(NSString *)other {
    
}
- (BOOL)isSame:(NSString *)one other:(NSString *)other {
    return [[self find:one] isEqualToString:[self find:other]];
}
@end
