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
- (BOOL)containElement:(NSString *)element;
- (void)addElenment:(NSString *)element;
- (BOOL)isEmpty;
- (void)clear;
- (void)remove:(NSString *)element;

@end

NS_ASSUME_NONNULL_END
