//
//  DictTree.h
//  LinkList
//
//  Created by 张占勇 on 2022/3/23.
//

#import <Foundation/Foundation.h>
#import "DNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface DictTree : NSObject

@property (nonatomic,strong) DNode *root;
@property (nonatomic, assign) NSInteger size;
- (DNode *)get:(NSString *)key;
- (BOOL)startWith:(NSString *)key;
- (BOOL)containElement:(NSString *)key;
- (void)addElenment:(NSString *)key;
- (BOOL)isEmpty;
- (void)clear;
- (void)remove:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
