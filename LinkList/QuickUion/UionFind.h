//
//  QuickUion.h
//  LinkList
//
//  Created by 张占勇 on 2022/3/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UionFind : NSObject
- (instancetype)initWith:(NSArray *)elements;
- (NSString * _Nullable)find:(NSString *)value;
- (void)uion:(NSString *)one other:(NSString *)other;
- (BOOL)isSame:(NSString *)one other:(NSString *)other;
@end

NS_ASSUME_NONNULL_END
